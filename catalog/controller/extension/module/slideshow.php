<?php
class ControllerExtensionModuleSlideshow extends Controller {
	public function index($setting) {
        
        $this->load->language('extension/module/slideshow');
        
		static $module = 0;		

		$this->load->model('design/banner');
		$this->load->model('tool/image');

		$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
		$this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');
        
        
        // added by assem
        
        
        		$data['ic_text'] = $this->language->get('ic_text');
                $data['collections'] = $this->language->get('collections');
                $data['see_all_collections'] = $this->language->get('see_all_collections');
                $data['welcome_text'] = $this->language->get('welcome_text');



        
        //
        
        
        

		$data['banners'] = array();

		$results = $this->model_design_banner->getBanner($setting['banner_id']);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['banners'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' =>$result['image'],// $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
				);
			}
		}

		$data['module'] = $module++;

		return $this->load->view('extension/module/slideshow', $data);
	}
}
