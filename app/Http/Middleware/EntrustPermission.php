<?php 

namespace App\Http\Middleware;

/**
 * This file is part of Entrust,
 * a role & permission management solution for Laravel.
 *
 * @license MIT
 * @package Zizaco\Entrust
 */

use Closure;
use Illuminate\Contracts\Auth\Guard;

class EntrustPermission
{
    const DELIMITER = '|';

    protected $auth;

    /**
     * Creates a new instance of the middleware.
     *
     * @param Guard $auth
     */
    public function __construct()
    {
        $this->auth = auth('admin');
        $this->company_auth = auth('company');
        $this->corporate_auth = auth('corporate');


        // Roles can visible to company
        $this->company_role = array('manage_manual_booking','manage_trips','view_driver','create_driver','update_driver','delete_driver','update_company','manage_statements','manage_cancel_trips','manage_owe_amount','manage_send_message','manage_driver_payments','manage_map','manage_heat_map','manage_payments','manage_rating','manage_requests','manage_vehicle');
        $this->corporate_role = array('view_rider','create_rider','update_rider','delete_rider','view_group','create_group','update_group','delete_group','view_policies','create_policies');

    }

    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  Closure $next
     * @param  $permissions
     * @return mixed
     */
    public function handle($request, Closure $next, $permissions)
    {
        if (!is_array($permissions)) {
            $permissions = explode(self::DELIMITER, $permissions);
        }

        //If URL is company And company user is guest than 404 
        if (LOGIN_USER_TYPE=='company' && LOGIN_USER_TYPE=='corporate'  && ($this->company_auth->guest() || $this->corporate_auth->guest() || !in_array($permissions[0], $this->company_role))) {
            abort(403);
        }
        else if (LOGIN_USER_TYPE == 'company') {
            return $next($request);
        }else if (LOGIN_USER_TYPE == 'corporate') {
            return $next($request);
        }

        if ($this->auth->guest() || !$this->auth->user()->hasPermission($permissions)) {
            abort(403);
        }

        return $next($request);
    }
}
