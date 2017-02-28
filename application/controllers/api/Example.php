<?php

defined('BASEPATH') OR exit('No direct script access allowed');

// This can be removed if you use __autoload() in config.php OR use Modular Extensions
require APPPATH . '/libraries/REST_Controller.php';

/**
 * This is an example of a few basic user interaction methods you could use
 * all done with a hardcoded array
 *
 * @package         CodeIgniter
 * @subpackage      Rest Server
 * @category        Controller
 * @author          Trivialworks
 * @license         MIT
 * @link            https://github.com/jaykaypee/codeigniter-secure-rest-server
 */
class Example extends REST_Controller {

    function __construct()
    {
        // Construct the parent class
        parent::__construct();
        $this->load->library('Key');  
        // Configure limits on our controller methods
        // Ensure you have created the 'limits' table and enabled 'limits' within application/config/rest.php
        $this->methods['user_get']['limit'] = 500; // 500 requests per hour per user/key
        $this->methods['users_get']['limit'] = 500; // 500 requests per hour per user/key
        $this->methods['user_post']['limit'] = 100; // 100 requests per hour per user/key
        $this->methods['users_post']['limit'] = 10; // 10 requests per hour per user/key
        $this->methods['user_delete']['limit'] = 50; // 50 requests per hour per user/key
    }
    
    
    public function auth_post(){
        $response = array();
        $this->form_validation->set_rules('email', 'email', 'required');
	$this->form_validation->set_rules('password', 'Password', 'required');
        if ($this->form_validation->run() == true)
        { //check to see if the user is logging in
            $q = "select userID,userName,email,last_login,createdOn from users where email = '".$this->db->escape_str($this->post('email'))."' and password = '".$this->db->escape_str($this->post('password'))."'";
            $qry = $this->db->query($q);
            
            if ($qry->num_rows() > 0)
            { 
                //if the login is successful
                $userData = $qry->row();                                
                $access_token = $this->key->generate(1, 0, $userData->userID);
                $response[$this->config->item('rest_status_field_name')]  = true;                
                $response[$this->config->item('rest_message_field_name')] = "login successfully";
                $response[$this->config->item('rest_key_name')]  = $access_token;
                $response["data"]    = $userData;                 
                $this->response($response, REST_Controller::HTTP_OK); // CREATED (200) being the HTTP response code
            }
            else
            { 
                 //if the login was un-successful
                    $response[$this->config->item('rest_status_field_name')]  = false;
                    $response[$this->config->item('rest_message_field_name')] = "login failed";                       
                    $this->response($response, REST_Controller::HTTP_NON_AUTHORITATIVE_INFORMATION); // not authoritative (203) being the HTTP response code
            }
        }
        else
        {      
                //set the flash data error message if there is one
                $response[$this->config->item('rest_status_field_name')]  = false;
                $response[$this->config->item('rest_message_field_name')] = validation_errors();
                $response["data"] = "";                   
                $this->response($response, REST_Controller::HTTP_BAD_REQUEST); // Bad request (400) being the HTTP response code
        } 
    }
    
    
    public function users_get()
    {
        // Users from a data store e.g. database
        $users = [
            ['id' => 1, 'name' => 'John', 'email' => 'john@example.com', 'fact' => 'Loves coding'],
            ['id' => 2, 'name' => 'Jim', 'email' => 'jim@example.com', 'fact' => 'Developed on CodeIgniter'],
            ['id' => 3, 'name' => 'Jane', 'email' => 'jane@example.com', 'fact' => 'Lives in the USA', ['hobbies' => ['guitar', 'cycling']]],
        ];

        $id = $this->get('id');

        // If the id parameter doesn't exist return all the users

        if ($id === NULL)
        {
            // Check if the users data store contains users (in case the database result returns NULL)
            if ($users)
            {
                // Set the response and exit
                $this->response($users, REST_Controller::HTTP_OK); // OK (200) being the HTTP response code
            }
            else
            {
                // Set the response and exit
                $this->response([
                    'status' => FALSE,
                    'message' => 'No users were found'
                ], REST_Controller::HTTP_NOT_FOUND); // NOT_FOUND (404) being the HTTP response code
            }
        }

        // Find and return a single record for a particular user.

        $id = (int) $id;

        // Validate the id.
        if ($id <= 0)
        {
            // Invalid id, set the response and exit.
            $this->response(NULL, REST_Controller::HTTP_BAD_REQUEST); // BAD_REQUEST (400) being the HTTP response code
        }

        // Get the user from the array, using the id as key for retreival.
        // Usually a model is to be used for this.

        $user = NULL;

        if (!empty($users))
        {
            foreach ($users as $key => $value)
            {
                if (isset($value['id']) && $value['id'] === $id)
                {
                    $user = $value;
                }
            }
        }

        if (!empty($user))
        {
            $this->set_response($user, REST_Controller::HTTP_OK); // OK (200) being the HTTP response code
        }
        else
        {
            $this->set_response([
                'status' => FALSE,
                'message' => 'User could not be found'
            ], REST_Controller::HTTP_NOT_FOUND); // NOT_FOUND (404) being the HTTP response code
        }
    }

    public function users_post()
    {
        // $this->some_model->update_user( ... );
        $message = [
            'id' => 100, // Automatically generated by the model
            'name' => $this->post('name'),
            'email' => $this->post('email'),
            'message' => 'Added a resource'
        ];

        $this->set_response($message, REST_Controller::HTTP_CREATED); // CREATED (201) being the HTTP response code
    }

    public function users_delete()
    {
        $id = (int) $this->get('id');

        // Validate the id.
        if ($id <= 0)
        {
            // Set the response and exit
            $this->response(NULL, REST_Controller::HTTP_BAD_REQUEST); // BAD_REQUEST (400) being the HTTP response code
        }

        // $this->some_model->delete_something($id);
        $message = [
            'id' => $id,
            'message' => 'Deleted the resource'
        ];

        $this->set_response($message, REST_Controller::HTTP_NO_CONTENT); // NO_CONTENT (204) being the HTTP response code
    }

}
