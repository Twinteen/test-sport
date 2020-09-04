<?php


namespace App\Http\Controllers;

use App\Models\Team;
use Illuminate\Http\JsonResponse;

class TeamController extends Controller {

    /**
     * @return JsonResponse
     */
    public function showAllTeams(): JsonResponse {
        return new JsonResponse([
            'teamsData' => Team::all()
        ]);
    }
}
