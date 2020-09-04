<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

/*Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});*/

Route::get('/event/showAll', 'EventController@showAllEvents');
Route::post('/event/add', 'EventController@addEvent');
Route::get('/event/categorize/{sport:name}', 'EventController@categorizeEventsBySport');
Route::get('/sport/showAll', 'SportController@showAllSportRecords');
Route::get('/team/showAll', 'TeamController@showAllTeams');

