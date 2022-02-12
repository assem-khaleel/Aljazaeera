<?php
class ModelCatalogPageGroup extends Model {
	public function addPageGroup($data) {
		$customField=(isset($data['custom']) && is_array($data['custom']))? $data['custom']:array();
		$customField=json_encode($customField);

		$this->db->query("INSERT INTO " . DB_PREFIX . "page_group SET
		 page_name = '" . $this->db->escape($data['page_name']) . "',
		 tab_name = '" . $this->db->escape($data['tab_name']) . "',
		 headline = '" . $this->db->escape($data['headline']) . "',
		 type = '" . $this->db->escape($data['type']) . "',
		 detail = '" .$data['detail'] . "',
		 custom = '" . $customField . "',
		  sort_order = '" . (int)$data['sort_order'] . "'");

		$page_group_id = $this->db->getLastId();

		if (isset($data['media'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "page_group SET media = '" . $this->db->escape($data['media']) . "' WHERE page_group_id = '" . (int)$page_group_id . "'");
		}

		if (isset($data['keyword'])) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'page_group_id=" . (int)$page_group_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('page_group');

		return $page_group_id;
	}

	public function editPageGroup($page_group_id, $data) {

		$customField=(isset($data['custom']) && is_array($data['custom']))? $data['custom']:array();
		$customField=json_encode($customField);

		$this->db->query("UPDATE " . DB_PREFIX . "page_group SET
		 page_name = '" . $this->db->escape($data['page_name']) . "',
		 tab_name = '" . $this->db->escape($data['tab_name']) . "',
		 headline = '" . $this->db->escape($data['headline']) . "',
		 type = '" . $this->db->escape($data['type']) . "',
		 detail = '" .$data['detail'] . "',
		 custom = '" . $customField . "',
		 sort_order = '" . (int)$data['sort_order'] . "' WHERE page_group_id = '" . (int)$page_group_id . "'");

		if (isset($data['media'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "page_group SET media = '" . $this->db->escape($data['media']) . "' WHERE page_group_id = '" . (int)$page_group_id . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'page_group_id=" . (int)$page_group_id . "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'page_group_id=" . (int)$page_group_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}

		$this->cache->delete('page_group');
	}

	public function deletePageGroup($page_group_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "page_group WHERE page_group_id = '" . (int)$page_group_id . "'");
//		$this->db->query("DELETE FROM " . DB_PREFIX . "page_group_to_store WHERE page_group_id = '" . (int)$page_group_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'page_group_id=" . (int)$page_group_id . "'");

		$this->cache->delete('page_group');
	}

	public function getPageGroup($page_group_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'page_group_id=" . (int)$page_group_id . "') AS keyword FROM " . DB_PREFIX . "page_group WHERE page_group_id = '" . (int)$page_group_id . "'");

		return $query->row;
	}

	public function getPageGroups($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "page_group";

		if (!empty($data['filter_name'])) {
			$sql .= " WHERE tab_name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		$sort_data = array(
			'tab_name',
			'sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY tab_name";
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

	public function getPageGroupStores($page_group_id) {return [];
		$page_group_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "page_group_to_store WHERE page_group_id = '" . (int)$page_group_id . "'");

		foreach ($query->rows as $result) {
			$page_group_store_data[] = $result['store_id'];
		}

		return $page_group_store_data;
	}

	public function getTotalPageGroups() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "page_group");

		return $query->row['total'];
	}
}
