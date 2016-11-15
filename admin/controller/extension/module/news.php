<?php
class ControllerExtensionModuleNews extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/news');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('news', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_line'] = $this->language->get('text_line');
		$data['text_column'] = $this->language->get('text_column');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_format'] = $this->language->get('entry_format');
		$data['entry_show_image'] = $this->language->get('entry_show_image');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_limit'] = $this->language->get('entry_limit');
		$data['entry_status'] = $this->language->get('entry_status');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['limit'])) {
			$data['error_limit'] = $this->error['limit'];
		} else {
			$data['error_limit'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/news', 'token=' . $this->session->data['token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/news', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/news', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('extension/module/news', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}

		if (isset($this->request->post['limit'])) {
			$data['limit'] = $this->request->post['limit'];
		} elseif (!empty($module_info)) {
			$data['limit'] = $module_info['limit'];
		} else {
			$data['limit'] = '';
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}

		if (isset($this->request->post['show_image'])) {
			$data['show_image'] = $this->request->post['show_image'];
		} elseif (!empty($module_info)) {
			$data['show_image'] = $module_info['show_image'];
		} else {
			$data['show_image'] = '';
		}

		if (isset($this->request->post['format'])) {
			$data['format'] = $this->request->post['format'];
		} elseif (!empty($module_info)) {
			$data['format'] = $module_info['format'];
		} else {
			$data['format'] = '';
		}

		// if (isset($this->request->post['news_status'])) {
		// 	$data['news_status'] = $this->request->post['news_status'];
		// } else {
		// 	$data['news_status'] = $this->config->get('news_status');
		// }

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/news', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/news')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if (!$this->request->post['limit']) {
			$this->error['limit'] = $this->language->get('error_limit');
		}

		return !$this->error;
	}

	public function install() {
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "news` (
		  `news_id` int(11) NOT NULL AUTO_INCREMENT,
		  `image` varchar(255) NOT NULL,
		  `date_added` datetime NOT NULL,
		  `status` tinyint(1) NOT NULL,
		  PRIMARY KEY (`news_id`)
		)");

		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "news_description` (
		  `news_description_id` int(11) NOT NULL AUTO_INCREMENT,
		  `news_id` int(11) NOT NULL,
		  `language_id` int(11) NOT NULL,
		  `title` varchar(255) COLLATE utf8_bin NOT NULL,
		  `description` text COLLATE utf8_bin NOT NULL,
		  `short_description` text COLLATE utf8_bin NOT NULL,
		  PRIMARY KEY (`news_description_id`)
		)");

		$this->load->model('user/user_group');

		$this->model_user_user_group->addPermission($this->user->getId(), 'access', 'extension/news');
		$this->model_user_user_group->addPermission($this->user->getId(), 'modify', 'extension/news');
	}

	public function uninstall() {
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "news`");
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "news_description`");
	}
}