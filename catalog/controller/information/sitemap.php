<?php
class ControllerInformationSitemap extends Controller {
	public function index() {
		$this->load->language('information/sitemap');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/sitemap')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_password'] = $this->language->get('text_password');
		$data['text_address'] = $this->language->get('text_address');
		$data['text_history'] = $this->language->get('text_history');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_cart'] = $this->language->get('text_cart');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_search'] = $this->language->get('text_search');
		$data['text_information'] = $this->language->get('text_information');
		$data['text_contact'] = $this->language->get('text_contact');

		$this->load->model('catalog/category');
		$this->load->model('catalog/product');


		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$data['categories'][] = array(
			'name'     => $this->language->get('text_home'),
			'children' => array(),
			'column'   =>  1,
			'href'     => $this->url->link('common/home', '')
		);

		$data['categories'][] = array(
			'name'     => $this->language->get('text_about_us'),
			'children' => array(),
			'column'   =>  1,
			'href'     => $this->url->link('information/information', 'information_id=4')
		);



		$categories = $this->model_catalog_category->getCategories(0);


		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}



		$this->load->model('catalog/branch');

		$branchCountry = $this->model_catalog_branch->getBranchsCountry();

		$children_country=[];
		foreach($branchCountry as $oneCountry){
			$children_country[] = array(
				'name'  => $this->language->get('text_'.$oneCountry) ,
				'href'  => $this->url->link('product/branch', 'country=' . $oneCountry)
			);
		}

		$data['categories'][] = array(
			'name'     =>  $this->language->get('text_boutiques')	,
			'children' => $children_country,
			'column'   =>  1,
			'href'     => $this->url->link('product/branch', '')
		);








		$this->load->model('catalog/page_group');

		$aPageNameList = $this->model_catalog_page_group->getPageNameList();
		foreach($aPageNameList as $pageName){


			$aPageTabList = $this->model_catalog_page_group->getPageTabList($pageName);

			$children_tabs=[];
			foreach($aPageTabList as $oneTab){
				$children_tabs[] = array(
					'name'  => $this->language->get('text_'.$oneTab),//$oneTab ,
					'href'  => $this->url->link('information/page_group', 'tab_name=' . $oneTab)
				);
			}

			$data['categories'][] = array(
				'name'     => $this->language->get('text_'.$pageName),//$pageName,
				'children' => $children_tabs,
				'column'   =>  1,
				'href'     => $this->url->link('information/page_group', '')
			);
		}//foreach aPageNameList





		$data['categories'][] = array(
			'name'     => $this->language->get('text_contact_us'),
			'children' => array(),
			'column'   =>  1,
			'href'     => $this->url->link('information/contact', '')
		);



		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['edit'] = $this->url->link('account/edit', '', true);
		$data['password'] = $this->url->link('account/password', '', true);
		$data['address'] = $this->url->link('account/address', '', true);
		$data['history'] = $this->url->link('account/order', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);
		$data['search'] = $this->url->link('product/search');
		$data['contact'] = $this->url->link('information/contact');

		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			$data['informations'][] = array(
				'title' => $result['title'],
				'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
			);
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('information/sitemap', $data));
	}
}