<?php

namespace App\Http\Middleware;

use Closure;
use Auth;
use App\Http\Start\Helpers;

class RedirectIfAdminAuthenticated
{

    /**
     * Creates a new instance of the middleware.
     *
     * @param Guard 
     */
    public function __construct()
    {
        $this->helper = new Helpers;
    }

    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {

        if ($request->segment(1)=='company' && Auth::guard('company')->guest()) {
            return redirect('signin_company');
        }elseif($request->segment(1)=='company' && Auth::guard('company')->user()->status == 'Inactive'){
            Auth::guard('company')->logout();
            $this->helper->flash_message('danger', 'Admin deactivated your account..');
            return redirect('signin_company');
        }

        if ($request->segment(1)=='corporate' && Auth::guard('corporate')->guest()) {
            return redirect('signin_corporate');
        }elseif($request->segment(1)=='corporate' && Auth::guard('corporate')->user()->status == 'Inactive'){
            Auth::guard('corporate')->logout();
            $this->helper->flash_message('danger', 'Admin deactivated your account..');
            return redirect('signin_corporate');
        }

        if ($request->segment(1)=='admin' && Auth::guard('admin')->guest()) {
            return redirect('admin/login');
        } else if ($request->segment(1)=='admin' && Auth::guard('admin')->user()->status == 'Inactive') {
            Auth::guard('admin')->logout();
            $this->helper->flash_message('danger', 'Admin deactivated your account..');
            return redirect('admin/login');
        }

        return $next($request);
    }
}
