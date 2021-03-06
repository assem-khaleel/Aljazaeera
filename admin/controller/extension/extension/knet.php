<?php 
class ControllerPaymentKNET extends Controller {
	private $error = array();
	
	public function index() {
	
		$this->load->language('payment/knet');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('setting/setting');
        
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('knet', $this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');
            
            $this->response->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));			
		}
        
		$data['heading_title'] = $this->language->get('heading_title');
        
		$data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_edit'] = $this->language->get('text_edit');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_all_zones'] = $this->language->get('text_all_zones');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
        
		$data['entry_alias'] = $this->language->get('entry_alias');
		$data['entry_status'] = $this->language->get('entry_status');
        $data['entry_sort_order'] = $this->language->get('entry_sort_order');
        
        $data['help_alias'] = $this->language->get('help_alias');
        
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
        
  		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
 		if (isset($this->error['alias'])) {
			$data['error_alias'] = $this->error['alias'];
		} else {
			$data['error_alias'] = '';
		}
  		$data['breadcrumbs'] = array();
   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);
   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_payment'),
			'href'      => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('payment/knet', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
        
		$data['action'] = $this->url->link('payment/knet', 'token=' . $this->session->data['token'], 'SSL');
		$data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');
        
		if (isset($this->request->post['knet_alias'])) {
			$data['knet_alias'] = $this->request->post['knet_alias'];
		} else {
			$data['knet_alias'] = $this->config->get('knet_alias');
		}
		
		if (isset($this->request->post['knet_status'])) {
			$data['knet_status'] = $this->request->post['knet_status'];
		} else {
			$data['knet_status'] = $this->config->get('knet_status');
		}
        
        if (isset($this->request->post['knet_sort_order'])) {
            $data['knet_sort_order'] = $this->request->post['knet_sort_order'];
        } else {
            $data['knet_sort_order'] = $this->config->get('knet_sort_order');
        }
        
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
        
        $this->response->setOutput($this->load->view('payment/knet', $data));
	}
	private function validate() {
		if (!$this->user->hasPermission('modify', 'payment/knet')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}		
		if (!$this->request->post['knet_alias']) {
			$this->error['alias'] = $this->language->get('error_alias');
		}
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}
?>