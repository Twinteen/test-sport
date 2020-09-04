<?php


namespace App\Repositories;

use Illuminate\Support\Facades\DB;
use \Illuminate\Support\Collection;

class EventRepository {

    /**
     * @param $sport_id
     * @param $team1_id
     * @param $team2_id
     * @return \Illuminate\Support\Collection
     */
    public static function checkIfTeamsExistAndReferToSameSport(int $sport_id, int $team1_id, int $team2_id): Collection {
        return DB::table('teams')
                   ->where('sport_id', $sport_id)
                   ->whereIn('id', [
                       $team1_id,
                       $team2_id
                   ])->get();
    }

    /**
     * @return \Illuminate\Support\Collection
     */
    public static function showAllEvents(): Collection {
        return DB::table('events')
                 ->leftJoin('sport', 'events.sport_id', '=', 'sport.id')
                 ->leftJoin('teams as t1', 'events.team1_id', '=', 't1.id')
                 ->leftJoin('teams as t2', 'events.team2_id', '=', 't2.id')
                 ->orderBy('events.date_time', 'asc')
                 ->select(
                     'events.id as id',
                     'sport.id as sportId',
                     'sport.name as sportName',
                     'events.date_time as eventDateTime',
                     't1.name as team1Name',
                     't2.name as team2Name')

                 ->get();
    }

    /**
     * @param $sportName
     * @return
     */
    public static function categorizeEventsBySport(string $sportName): Collection {
        return DB::table('events')
        ->leftJoin('sport', 'events.sport_id', '=', 'sport.id')
            ->leftJoin('teams as t1', 'events.team1_id', '=', 't1.id')
            ->leftJoin('teams as t2', 'events.team2_id', '=', 't2.id')
            ->where('sport.name', '=', $sportName)
            ->orderBy('events.date_time', 'asc')
            ->select(
                'events.id as id',
                'sport.id as sportId',
                'sport.name as sportName',
                'events.date_time as eventDateTime',
                't1.name as team1Name',
                't2.name as team2Name')

            ->get();
    }
}
