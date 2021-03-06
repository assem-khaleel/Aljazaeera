<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');

		$data['scripts'] = $this->document->getScripts('footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
        
        
        //added by assem al jimzawi
        
        
        $data['hot_collections'] = $this->language->get('hot_collections');
        $data['new_fragrance'] = $this->language->get('new_fragrance');

        $data['shop_now'] = $this->language->get('shop_now');
        $data['sale'] = $this->language->get('sale');
        $data['about_us'] = $this->language->get('about_us');
        $data['careers'] = $this->language->get('careers');
        $data['faq'] = $this->language->get('faq');
        $data['login'] = $this->language->get('login');
        $data['register'] = $this->language->get('register');
        $data['cart'] = $this->language->get('cart');
        $data['submit'] = $this->language->get('submit');
        $data['follow_us'] = $this->language->get('follow_us');
        $data['text_powered'] = $this->language->get('text_powered');
        $data['privacy_policy'] = $this->language->get('privacy_policy');
        $data['terms_conditions'] = $this->language->get('terms_conditions');
        $data['copy_right'] = $this->language->get('copy_right');
        $data['placeholder_your_emails'] = $this->language->get('placeholder_your_emails');



        
        //

		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}

		$data['aboutUsLink']=$this->url->link('information/information', 'information_id= 4 ' );
		$data['careersLink']=$this->url->link('information/information', 'information_id= 7 ' );
		$data['faqLink']=$this->url->link('information/information', 'information_id= 8' );
		$data['policyLink']=$this->url->link('information/information', 'information_id= 3' );
		$data['termsLink']=$this->url->link('information/information', 'information_id= 5' );
		$data['sitemapLink']=$this->url->link('information/sitemap', '' );

		$data['registerLink'] = $this->url->link('account/register', '', true);
		$data['loginLink'] = $this->url->link('account/login', '', true);
		$data['cartLink'] = $this->url->link('checkout/cart');



		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', true);
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', true);
		$data['affiliate'] = $this->url->link('affiliate/account', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);

		$data['collectionLink']= $this->url->link('common/home/collection', '', true);
		$data['fragranceLink']= $this->url->link('common/home/fragrance', '', true);
		$data['saleLink']= $this->url->link('product/special', '', true);
		$data['newsletterLink']= $this->url->link('common/newsletter', '', true);

		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}


		return $this->load->view('common/footer', $data);
	}
}
