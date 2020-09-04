<?php

namespace App\Http\Controllers;

use App\Models\Event;
use App\Models\Sport;
use App\Repositories\EventRepository;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class EventController extends Controller
{
    public function showAllEvents(): JsonResponse {
        $data = EventRepository::showAllEvents();

        return new JsonResponse([
            'eventsData' => $data
        ]);
    }

    /**
     * @param Request $request
     * @return JsonResponse
     */
    public function addEvent(Request $request): JsonResponse {
        $requiredProperties = $request->only([
            'date_time',
            'team1_id',
            'team2_id',
            'sport_id',
        ]);

        // Additional check if selected teams exist and have requested sport type
        $teams = EventRepository::checkIfTeamsExistAndReferToSameSport(
            $requiredProperties['sport_id'],
            $requiredProperties['team1_id'],
            $requiredProperties['team2_id']
        );

        if ($requiredProperties['team1_id'] === $requiredProperties['team2_id']) {
            return new JsonResponse('Team cannot play against itself.', Response::HTTP_NOT_ACCEPTABLE);
        } else if (count($teams) !== 2) {
            return new JsonResponse('Selected Teams don\'t exist.', Response::HTTP_NOT_ACCEPTABLE);
        }

        Event::create($requiredProperties);

        return new JsonResponse([
            'eventsData' => EventRepository::showAllEvents()
        ], Response::HTTP_CREATED);
    }

    /**
     * @param Sport $sport
     * @return JsonResponse
     */
    public function categorizeEventsBySport(Sport $sport): JsonResponse {
        $data = EventRepository::categorizeEventsBySport($sport);

        return new JsonResponse([
            'eventsData' => $data
        ]);
    }
}
