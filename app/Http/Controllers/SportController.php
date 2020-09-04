<?php


namespace App\Http\Controllers;

use App\Models\Sport;
use Illuminate\Http\JsonResponse;

class SportController extends Controller {

    /**
     * @return JsonResponse
     */
    public function showAllSportRecords(): JsonResponse {
        return new JsonResponse([
            'sportData' => Sport::all()
        ]);
    }
}
