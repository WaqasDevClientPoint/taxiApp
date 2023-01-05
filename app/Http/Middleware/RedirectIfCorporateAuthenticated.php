<?php

namespace App\Http\Middleware;

use Closure;
use Auth;

class RedirectIfCorporateAuthenticated
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (Auth::guard('web')->guest()) {
            return redirect('signin_corporate');
        }

        if (Auth::user()->status == 'Inactive') {
            Auth::logout();
            return redirect('signin_corporate');
        }
        
        if(Auth::user()->user_type == 'Corporate')
            return $next($request);
        else
            abort(403);

        return $next($request);

    }
}
