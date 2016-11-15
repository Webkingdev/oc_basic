<?php
class ControllerExtensionModuleNews extends Controller {
	public function index($setting) {
		$this->language->load('extension/module/news');
		$this->load->model('extension/news');
		$this->load->model('tool/image');
		$this->document->addStyle('catalog/view/theme/default/stylesheet/news_list.css');


		$filter_data = array(
			'page' => 1,
			// 'limit' => 5,
			'limit' => $setting['limit'],
			'start' => 0,
		);
		$data['format'] = $setting['format'];
		$data['show_image'] = $setting['show_image'];
		$data['heading_title'] = $this->language->get('heading_title');
		$data['all_news_href'] = $this->url->link('information/news');

		$all_news = $this->model_extension_news->getAllNews($filter_data);

		$data['all_news'] = array();

		foreach ($all_news as $news) {
			$data['all_news'][] = array (
				'title' 		=> html_entity_decode($news['title'], ENT_QUOTES),
				// 'description' 	=> (utf8_strlen(strip_tags(html_entity_decode($news['short_description'], ENT_QUOTES))) > 50 ? utf8_substr(strip_tags(html_entity_decode($news['short_description'], ENT_QUOTES)), 0, 50) . '...' : strip_tags(html_entity_decode($news['short_description'], ENT_QUOTES))),
				'description' 	=> strip_tags(html_entity_decode($news['short_description'], ENT_QUOTES)),
				'view' 			=> $this->url->link('information/news/news', 'news_id=' . $news['news_id']),
				'date_added' 	=> date($this->language->get('date_format_short'), strtotime($news['date_added'])),
				'image'			=> $this->model_tool_image->resize($news['image'], 250, 250),
			);
		}

		return $this->load->view('extension/module/news', $data);
	}
}