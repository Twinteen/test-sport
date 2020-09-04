<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
/**
 * Class Event
 * @package App
 */
class Event extends Model {
    protected $fillable = [
        'date_time',
        'team1_id',
        'team2_id',
        'sport_id',
    ];

    public $timestamps = false;
}
