<?php
class ModelCheckoutNewsletter extends Model {


	public function getAll($data = array()) {

		$sql = "SELECT * FROM " . DB_PREFIX . "newsletter";

		if (!empty($data['filter_email'])) {
			$sql .= " WHERE email LIKE '%" . $this->db->escape($data['filter_email']) . "%'";
		}

		$sort_data = array(
			'email',
			'status'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY email";
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


	public function getTotalNewsletter($data = array()) {



		$sql = "SELECT COUNT(*) as total FROM " . DB_PREFIX . "newsletter";

		if (!empty($data['filter_email'])) {
			$sql .= " WHERE email LIKE '%" . $this->db->escape($data['filter_email']) . "%'";
		}




		$query = $this->db->query($sql);

		 return $query->row['total'];;



	}


	public function getEmails($data) {
		$sql = "SELECT DISTINCT email FROM " . DB_PREFIX . "newsletter WHERE status = '1' " ;


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

		$emails=[];
		foreach ($query->row as $result) {
			$emails[] = $result['email'];
		}
		return $emails;
	}


	public function changeSubscribe($hashCode,$status){

		$query = $this->db->query("update " . DB_PREFIX . "newsletter  set status = '".$status."' WHERE hash = '".$hashCode."'");
		return $query;

	}


	public function addNewEmail($email){

		$hash=md5($email.'PhP&P'.gmdate('Y-m-d s m'));

		$query = $this->db->query("insert into  " . DB_PREFIX . "newsletter (email,hash,status) values ('".$email."','".$hash."','1' )");
		return $query;

	}

	public function removeEmail($email){

		$query = $this->db->query("delete from " . DB_PREFIX . "newsletter where email='".$email."'");
		return $query;

	}
}