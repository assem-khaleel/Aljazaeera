<?php
class ControllerCatalogPageGroup extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('catalog/page_group');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/page_group');

		$this->getList();
	}

	public function add() {
		$this->load->language('catalog/page_group');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/page_group');


		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_page_group->addPageGroup($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('catalog/page_group', 'token=' . $this->session->data['token'] . $url, true));
		}else{

//			var_dump( $this->error);
//			die(var_dump( $this->validateForm()));
		}

		$this->getForm();
	}

	public function edit() {
		$this->load->language('catalog/page_group');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/page_group');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_page_group->editPageGroup($this->request->get['page_group_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('catalog/page_group', 'token=' . $this->session->data['token'] . $url, true));
		}
		$this->getForm();
	}

	public function delete() {
		$this->load->language('catalog/page_group');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/page_group');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $page_group_id) {
				$this->model_catalog_page_group->deletePageGroup($page_group_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('catalog/page_group', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'name';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/page_group', 'token=' . $this->session->data['token'] . $url, true)
		);

		$data['add'] = $this->url->link('catalog/page_group/add', 'token=' . $this->session->data['token'] . $url, true);
		$data['delete'] = $this->url->link('catalog/page_group/delete', 'token=' . $this->session->data['token'] . $url, true);

		$data['page_groups'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$page_group_total = $this->model_catalog_page_group->getTotalPageGroups();

		$results = $this->model_catalog_page_group->getPageGroups($filter_data);

		foreach ($results as $result) {
			$data['page_groups'][] = array(
				'page_group_id' => $result['page_group_id'],
				'headline'            => $result['headline'],
				'tab_name'            => $result['tab_name'],
				'page_name'            => $result['page_name'],
				'sort_order'      => $result['sort_order'],
				'edit'            => $this->url->link('catalog/page_group/edit', 'token=' . $this->session->data['token'] . '&page_group_id=' . $result['page_group_id'] . $url, true)
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_name'] = $this->url->link('catalog/page_group', 'token=' . $this->session->data['token'] . '&sort=name' . $url, true);
		$data['sort_sort_order'] = $this->url->link('catalog/page_group', 'token=' . $this->session->data['token'] . '&sort=sort_order' . $url, true);

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $page_group_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('catalog/page_group', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($page_group_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($page_group_total - $this->config->get('config_limit_admin'))) ? $page_group_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $page_group_total, ceil($page_group_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/page_group_list', $data));
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['page_group_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_percent'] = $this->language->get('text_percent');
		$data['text_amount'] = $this->language->get('text_amount');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_keyword'] = $this->language->get('entry_keyword');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$data['entry_country'] = $this->language->get('entry_country');
		$data['entry_phone'] = $this->language->get('entry_phone');
		$data['entry_address'] = $this->language->get('entry_address');
		$data['entry_detail'] = $this->language->get('entry_detail');

		$data['entry_headline'] = $this->language->get('entry_headline');
		$data['entry_page_name'] = $this->language->get('entry_page_name');
		$data['entry_tab_name'] = $this->language->get('entry_tab_name');
		$data['entry_phone'] = $this->language->get('entry_phone');
		$data['entry_link'] = $this->language->get('entry_link');
		$data['entry_type'] = $this->language->get('entry_type');

		$data['entry_date'] = $this->language->get('entry_date');


		$data['entry_customer_group'] = $this->language->get('entry_customer_group');

		$data['help_keyword'] = $this->language->get('help_keyword');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['page_name'])) {
			$data['error_page_name'] = $this->error['page_name'];
		} else {
			$data['error_page_name'] = '';
		}

		if (isset($this->error['keyword'])) {
			$data['error_keyword'] = $this->error['keyword'];
		} else {
			$data['error_keyword'] = '';
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/page_group', 'token=' . $this->session->data['token'] . $url, true)
		);

		if (!isset($this->request->get['page_group_id'])) {
			$data['action'] = $this->url->link('catalog/page_group/add', 'token=' . $this->session->data['token'] . $url, true);
		} else {
			$data['action'] = $this->url->link('catalog/page_group/edit', 'token=' . $this->session->data['token'] . '&page_group_id=' . $this->request->get['page_group_id'] . $url, true);
		}

		$data['cancel'] = $this->url->link('catalog/page_group', 'token=' . $this->session->data['token'] . $url, true);

		if (isset($this->request->get['page_group_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$page_group_info = $this->model_catalog_page_group->getPageGroup($this->request->get['page_group_id']);
		}

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->post['page_name'])) {
			$data['page_name'] = $this->request->post['page_name'];
		} elseif (!empty($page_group_info)) {
			$data['page_name'] = $page_group_info['page_name'];
		} else {
			$data['page_name'] = '';
		}

		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();

		if (isset($this->request->post['page_group_store'])) {
			$data['page_group_store'] = $this->request->post['page_group_store'];
		} elseif (isset($this->request->get['page_group_id'])) {
			$data['page_group_store'] = $this->model_catalog_page_group->getPageGroupStores($this->request->get['page_group_id']);
		} else {
			$data['page_group_store'] = array(0);
		}

		if (isset($this->request->post['keyword'])) {
			$data['keyword'] = $this->request->post['keyword'];
		} elseif (!empty($page_group_info)) {
			$data['keyword'] = $page_group_info['keyword'];
		} else {
			$data['keyword'] = '';
		}

		if (isset($this->request->post['media'])) {
			$data['media'] = $this->request->post['media'];
		} elseif (!empty($page_group_info)) {
			$data['media'] = $page_group_info['media'];
		} else {
			$data['media'] = '';
		}

		$this->load->model('tool/image');

		if (isset($this->request->post['media']) && is_file(DIR_IMAGE . $this->request->post['media'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['media'], 100, 100);
		} elseif (!empty($page_group_info) && is_file(DIR_IMAGE . $page_group_info['media'])) {
			$data['thumb'] = $this->model_tool_image->resize($page_group_info['media'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($page_group_info)) {
			$data['sort_order'] = $page_group_info['sort_order'];
		} else {
			$data['sort_order'] = '';
		}

		if (isset($this->request->post['tab_name'])) {
			$data['tab_name'] = $this->request->post['tab_name'];
		} elseif (!empty($page_group_info)) {
			$data['tab_name'] = $page_group_info['tab_name'];
		} else {
			$data['tab_name'] = '';
		}


		if (isset($this->request->post['headline'])) {
			$data['headline'] = $this->request->post['headline'];
		} elseif (!empty($page_group_info)) {
			$data['headline'] = $page_group_info['headline'];
		} else {
			$data['headline'] = '';
		}


		if (isset($this->request->post['type'])) {
			$data['type'] = $this->request->post['type'];
		} elseif (!empty($page_group_info)) {
			$data['type'] = $page_group_info['type'];
		} else {
			$data['type'] = '';
		}



		if (isset($this->request->post['detail'])) {
			$data['detail'] = $this->request->post['detail'];
		} elseif (!empty($page_group_info)) {
			$data['detail'] = $page_group_info['detail'];
		} else {
			$data['detail'] = '';
		}

		if (isset($this->request->post['custom'])) {
			$data['custom'] = @json_encode($this->request->post['custom']);

		} elseif (!empty($page_group_info)) {
			$data['custom'] = $page_group_info['custom'];
		} else {
			$data['custom'] = array();
		}


		$customArray = @json_decode($data['custom'],true);
		if ($customArray == null || json_last_error() !== JSON_ERROR_NONE) {

			$data['phone']='';
			$data['address']='';
			$data['date']='';
			$data['link']='';
		}else{

			$data['link']=(array_key_exists('link',$customArray))? $customArray['link']:'';
			$data['phone']=(array_key_exists('phone',$customArray))? $customArray['phone']:'';
			$data['address']=(array_key_exists('address',$customArray))? $customArray['address']:'';
			$data['date']=(array_key_exists('date',$customArray))? $customArray['date']:'';

		}


		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/page_group_form', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/page_group')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['tab_name']) < 2) || (utf8_strlen($this->request->post['tab_name']) > 64)) {
			$this->error['error_tab_name'] = $this->language->get('error_tab_name');
		}

		if ((utf8_strlen($this->request->post['page_name']) < 2) || (utf8_strlen($this->request->post['page_name']) > 64)) {
			$this->error['error_page_name'] = $this->language->get('error_page_name');
		}

		if (utf8_strlen($this->request->post['keyword']) > 0) {
			$this->load->model('catalog/url_alias');

			$url_alias_info = $this->model_catalog_url_alias->getUrlAlias($this->request->post['keyword']);

			if ($url_alias_info && isset($this->request->get['page_group_id']) && $url_alias_info['query'] != 'page_group_id=' . $this->request->get['page_group_id']) {
				$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
			}

			if ($url_alias_info && !isset($this->request->get['page_group_id'])) {
				$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
			}
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/page_group')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

//		$this->load->model('catalog/product');
//
//		foreach ($this->request->post['selected'] as $page_group_id) {
//			$product_total = $this->model_catalog_product->getTotalProductsByPageGroupId($page_group_id);
//
//			if ($product_total) {
//				$this->error['warning'] = sprintf($this->language->get('error_product'), $product_total);
//			}
//		}

		return !$this->error;
	}

	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('catalog/page_group');

			$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 5
			);

			$results = $this->model_catalog_page_group->getPageGroups($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'page_group_id' => $result['page_group_id'],
					'name'            => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}