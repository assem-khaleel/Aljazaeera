<?php
class ModelCatalogPageGroup extends Model {
	public function getPageGroup($page_group_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "page_group m ");

		return $query->row;
	}

	public function getPageGroups($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "page_group m  ";

			$sort_data = array(
				'tab_name',
				'sort_order'
			);

			if (isset($data['tab_name']) ) {
				$sql .= " where tab_name = '" . $data['tab_name']."' ";
			}

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
		} else {
			$page_group_data = $this->cache->get('page_group.' . (int)$this->config->get('config_store_id'));

//			if (!$page_group_data) {
//				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "page_group m LEFT JOIN " . DB_PREFIX . "page_group_to_store m2s ON (m.page_group_id = m2s.page_group_id) WHERE m2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY name");
//
//				$page_group_data = $query->rows;
//
//				$this->cache->set('page_group.' . (int)$this->config->get('config_store_id'), $page_group_data);
//			}

			return $page_group_data;
		}
	}



	public function getPageNameList(){

		$sql = "SELECT distinct(page_name) FROM " . DB_PREFIX . "page_group m  order by sort_order ";

		$query = $this->db->query($sql);

		$aPageName=array();
		foreach ($query->rows as $result) {
			if($result['page_name'] == '') continue;
			$aPageName[$result['page_name']]=$result['page_name'];
		}
		return $aPageName;
	}
	public function getPageTabList($page_name =''){

		$sql = "SELECT distinct(tab_name) FROM " . DB_PREFIX . "page_group m  where page_name='".$page_name."'  order by sort_order";

		$query = $this->db->query($sql);

		$aTabName=array();
		foreach ($query->rows as $result) {
			if($result['tab_name'] == '') continue;
			$aTabName[$result['tab_name']]=$result['tab_name'];
		}
		return $aTabName;
	}
}