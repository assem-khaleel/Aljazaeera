<?php
class ModelCatalogBranch extends Model {
	public function addBranch($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "branch SET
		 name = '" . $this->db->escape($data['name']) . "',
		 address = '" . $this->db->escape($data['address']) . "',
		 country = '" . $this->db->escape($data['country']) . "',
		 phone = '" . $this->db->escape($data['phone']) . "',
		 detail = '" . $this->db->escape($data['detail']) . "',
		  sort_order = '" . (int)$data['sort_order'] . "'");

		$branch_id = $this->db->getLastId();

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "branch SET image = '" . $this->db->escape($data['image']) . "' WHERE branch_id = '" . (int)$branch_id . "'");
		}

//		if (isset($data['branch_store'])) {
//			foreach ($data['branch_store'] as $store_id) {
//				$this->db->query("INSERT INTO " . DB_PREFIX . "branch_to_store SET branch_id = '" . (int)$branch_id . "', store_id = '" . (int)$store_id . "'");
//			}
//		}

		if (isset($data['keyword'])) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'branch_id=" . (int)$branch_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('branch');

		return $branch_id;
	}

	public function editBranch($branch_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "branch SET
		name = '" . $this->db->escape($data['name']) . "',

		 address = '" . $this->db->escape($data['address']) . "',
		 country = '" . $this->db->escape($data['country']) . "',
		 phone = '" . $this->db->escape($data['phone']) . "',
		 detail = '" . $this->db->escape($data['detail']) . "',
		 sort_order = '" . (int)$data['sort_order'] . "' WHERE branch_id = '" . (int)$branch_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "branch SET image = '" . $this->db->escape($data['image']) . "' WHERE branch_id = '" . (int)$branch_id . "'");
		}

//		$this->db->query("DELETE FROM " . DB_PREFIX . "branch_to_store WHERE branch_id = '" . (int)$branch_id . "'");
//
//		if (isset($data['branch_store'])) {
//			foreach ($data['branch_store'] as $store_id) {
//				$this->db->query("INSERT INTO " . DB_PREFIX . "branch_to_store SET branch_id = '" . (int)$branch_id . "', store_id = '" . (int)$store_id . "'");
//			}
//		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'branch_id=" . (int)$branch_id . "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'branch_id=" . (int)$branch_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('branch');
	}

	public function deleteBranch($branch_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "branch WHERE branch_id = '" . (int)$branch_id . "'");
//		$this->db->query("DELETE FROM " . DB_PREFIX . "branch_to_store WHERE branch_id = '" . (int)$branch_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'branch_id=" . (int)$branch_id . "'");

		$this->cache->delete('branch');
	}

	public function getBranch($branch_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'branch_id=" . (int)$branch_id . "') AS keyword FROM " . DB_PREFIX . "branch WHERE branch_id = '" . (int)$branch_id . "'");

		return $query->row;
	}

	public function getBranchs($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "branch";

		if (!empty($data['filter_name'])) {
			$sql .= " WHERE name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		$sort_data = array(
			'name',
			'sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY name";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getBranchStores($branch_id) {return [];
		$branch_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "branch_to_store WHERE branch_id = '" . (int)$branch_id . "'");

		foreach ($query->rows as $result) {
			$branch_store_data[] = $result['store_id'];
		}

		return $branch_store_data;
	}

	public function getTotalBranchs() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "branch");

		return $query->row['total'];
	}
}
