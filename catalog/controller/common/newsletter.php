<?php
class ControllerCommonNewsletter extends Controller {
	private $error = array();

	public function index() {

		if(!isset($this->request->post['email']) ) return false;

		$this->load->model('checkout/newsletter');

		$this->model_checkout_newsletter->addNewEmail($this->request->post['email']);
		$this->response->redirect($this->url->link('common/home', '', true));
	}



	public function cancelNewsletter(){

		if(!isset($this->request->get['hash']) || !isset($this->request->get['status'])) return false;


		$this->load->model('checkout/newsletter');

		$this->model_checkout_newsletter->changeSubscribe($this->request->get['hash'],$this->request->get['status']);

		$this->response->redirect($this->url->link('common/home', '', true));

	}

}