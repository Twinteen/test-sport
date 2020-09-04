<template>
    <div>
        <main role="main" class="container">
            <div class="d-flex align-items-center p-3 my-3 text-white-50 bg-purple rounded shadow-sm">
                <div class="lh-100">
                    <h1 class="mb-0 text-white text-center lh-100">Calendar</h1>
                </div>
            </div>
            <div class="form-check ml-3">
                <input class="form-check-input" type="checkbox" value="" id="categorize"
                       v-model="categorize"
                       @change="check()">
                <label class="form-check-label" for="categorize">
                    Categorize by Sport
                </label>
            </div>
            <div v-if="categorize !== true">
                <div class="my-3 p-3 bg-white rounded shadow-sm">
                    <h6 class="border-bottom border-gray pb-2 mb-0">Events</h6>
                    <div v-for="event in events">
                        <div class="media text-muted pt-3">
                            <svg class="bd-placeholder-img mr-2 mt-8 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 32x32">
                                <rect width="100%" height="100%" v-bind:fill="getColorForSport(event.sportId)"/>
                            </svg>
                            <p class="media-body pb-3 mb-0 medium lh-125 border-bottom border-gray">
                                <strong class="d-block text-gray-dark">{{ event.sportName }}</strong>
                                {{ prepareDateFormat(event.eventDateTime) }}, {{ event.team1Name }} - {{ event.team2Name }}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div v-else>
                <div class="my-3 p-3 bg-white rounded shadow-sm" v-for="(groupedEvents, name) in categorizedEvents">
                    <h6 class="border-bottom border-gray pb-2 mb-0">
                        {{ name }}
                    </h6>
                    <div v-for="event in groupedEvents">
                        <div class="media text-muted pt-3">
                            <svg class="bd-placeholder-img mr-2 mt-8 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 32x32">
                                <rect width="100%" height="100%" v-bind:fill="getColorForSport(event.sportId)"/>
                            </svg>
                            <p class="media-body pb-3 mb-0 medium lh-125 border-bottom border-gray">
                                <strong class="d-block text-gray-dark">{{ event.sportName }}</strong>
                                {{ prepareDateFormat(event.eventDateTime) }}, {{ event.team1Name }} - {{ event.team2Name }}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mb-5">
                <div class="col text-center">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#newEvent">
                        Add new Event
                    </button>
                </div>
            </div>
            <modal
                :teams=teams
                :sportData=sportData
                :eventsClosure=closureForEvents
                :events = events

            >
            </modal>
        </main>
    </div>
</template>

<script>
import moment from "moment";
export default {
    name: "Calendar",
    data() {
        return {
            events: [],
            sportData: [],
            teams: [],
            categorize: false,
            categorizedEvents: {},

            //This is done to avoid mutating prop and have influence on parent component from child component
            closureForEvents: (events) => {
                this.events = events;
            },
        }
    },
    created() {
        this.getFullData();
    },
    methods: {
        getFullData() {
            this.getEvents();

            if (this.sportData.length === 0) {
                this.getSportData();
            }

            if (this.teams.length === 0) {
                this.getTeams();
            }
        },
        getEvents() {
            fetch('/api/event/showAll')
                .then(res => res.json())
                .then(res => {
                    this.events = res.eventsData
                })
        },
        getSportData() {
            fetch('/api/sport/showAll')
                .then(res => res.json())
                .then(res => {
                    this.sportData = res.sportData
                })
        },
        getTeams() {
            fetch('/api/team/showAll')
                .then(res => res.json())
                .then(res => {
                    this.teams = res.teamsData
                })
        },
        getColorForSport(sportId) {
            switch (sportId) {
                case 1:
                    return '#007bff';
                case 2:
                    return '#e83e8c';
                case 3:
                    return '#6f42c1';
                case 4:
                    return '#35B242';
                default:
                    return '#FFFFFF';
            }
        },
        prepareDateFormat(date) {
            return `${moment(date).format('YYYY-MM-DD HH:mm')}`
        },
        check() {
            if (this.categorize) {
                let categorizedEvents = {};
                this.sportData.forEach(function (value) {
                    categorizedEvents[value.name] = [];
                });

                this.events.forEach(function (value) {
                    if (categorizedEvents.hasOwnProperty(value.sportName)) {
                        categorizedEvents[value.sportName].push(value);
                    }
                })

                this.categorizedEvents = categorizedEvents;
            }
        }
    }
}
</script>

<style scoped>

</style>
