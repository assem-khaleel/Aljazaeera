<?php
class ModelCatalogBranch extends Model {
	public function getBranch($branch_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "branch m LEFT JOIN " . DB_PREFIX . "branch_to_store m2s ON (m.branch_id = m2s.branch_id) WHERE m.branch_id = '" . (int)$branch_id . "' AND m2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");

		return $query->row;
	}

	public function getBranchs($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "branch m ";

			$sort_data = array(
				'name',
				'sort_order'
			);

			if (isset($data['country']) ) {
				$sql .= " where country = '" . $data['country']."' ";
			}

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
		} else {
			$branch_data = $this->cache->get('branch.' . (int)$this->config->get('config_store_id'));

			if (!$branch_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "branch m   ORDER BY name");

				$branch_data = $query->rows;

				$this->cache->set('branch.' . (int)$this->config->get('config_store_id'), $branch_data);
			}

			return $branch_data;
		}
	}

	public function getBranchsCountry(){

		$sql = "SELECT distinct(country) FROM " . DB_PREFIX . "branch m  ";

		$query = $this->db->query($sql);

		$aCountry=array();
		foreach ($query->rows as $result) {
			if($result['country'] == '') continue;
			$aCountry[$result['country']]=$result['country'];
		}
		return $aCountry;
	}
}