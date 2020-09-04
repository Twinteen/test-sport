<template>
    <div>
        <div class="modal fade" id="newEvent" ref="modalAddEvent" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">New Event</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="sportType" class="col-form-label">Sport:</label>
                                <select class="form-control" id="sportType"
                                        v-model="sport"
                                        @change="filterForTeam1()">
                                    <option value=0></option>
                                    <option v-for="(sportType, index) in sportData"
                                            :value="sportType.id"
                                            :key="index">
                                        {{ sportType.name }}
                                    </option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="sportType" class="col-form-label">Team1:</label>
                                <select class="form-control" id="team1" :disabled="disabled.team1"
                                        v-model="team1"
                                        @change="filterForTeam2()">
                                    <option value=0></option>
                                    <option v-for="(team, index) in filteredTeams1"
                                            :value="team.id"
                                            :key="index">
                                        {{ team.name }}
                                    </option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="sportType" class="col-form-label">Team2:</label>
                                <select class="form-control" id="team2" :disabled="disabled.team2"
                                        v-model="team2">
                                    <option value=0></option>
                                    <option v-for="(team, index) in filteredTeams2"
                                            :value="team.id"
                                            :key="index">
                                        {{ team.name }}
                                    </option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="date">Date:</label>
                                <input type="date" class="form-control" id="date" v-model="date">
                            </div>
                            <div class="form-group">
                                <label for="time">Date:</label>
                                <input type="time" class="form-control" id="time" v-model="time">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary"
                           @click="addEvent()">
                            Add Event
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>

export default {
    name: "Modal",
    props: {
        teams: {
            type: Array,
            required: true
        },
        sportData: {
            type: Array,
            required: true
        },
        events: {
            type: Array,
            required: true
        },
        eventsClosure: {
            required: true
        }
    },
    data() {
        return {
            date: '',
            time: '',
            sport: 0,
            team1: 0,
            team2: 0,
            disabled: {
                team1: true,
                team2: true
            },
            filteredTeams1: [],
            filteredTeams2: []
        };
    },
    methods: {
        addEvent() {
            if (!this.checkIfAllFieldsAreFilled()) {
                return;
            }

            const requestOptions = {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({
                    date_time: `${this.date} ${this.time}`,
                    team1_id: this.team1,
                    team2_id: this.team2,
                    sport_id: this.sport
                })
            };
            fetch('/api/event/add', requestOptions)
                .then(response => {
                    if (response.status !== 201) {
                        console.log(JSON.stringify(response.body) +
                            response.status);
                        alert(JSON.stringify(response.body));
                        return;
                    }
                    return response.json()

                }).then((res) => {
                this.editEvents(res);
                alert('Saved');
            });
        },
        editEvents(data) {
            this.eventsClosure(data.eventsData);
        },
        checkIfAllFieldsAreFilled() {
            let errorMessage = '';

            if (!this.team1) errorMessage = errorMessage.concat(' ', 'Team1 has not been selected.');
            if (!this.team2) errorMessage = errorMessage.concat(' ', 'Team2 has not been selected.');
            if (!this.sport) errorMessage = errorMessage.concat(' ', 'Sport has not been selected.');
            if (!this.date) errorMessage = errorMessage.concat(' ', 'Date has not been selected.');
            if (!this.time) errorMessage = errorMessage.concat(' ', 'Time has not been selected.');

            if (errorMessage) {
                alert(errorMessage);
                return false
            }

            return true;
        },
        filterForTeam1() {
            if (this.sport != 0) {
                this.disabled.team1 = false;
                this.filterTeamsBySport(this.sport);
            } else {
                this.refreshTeams()
                this.disabled.team1 = true;
                this.disabled.team2 = true;
            }
        },
        filterForTeam2() {
            if (this.team1 != 0) {
                this.removeSameTeam(this.team1);
                this.disabled.team2 = false;
            } else {
                this.team2 = 0;
                this.disabled.team2 = true;
            }
        },
        filterTeamsBySport(sport) {
            if (sport == 0) return ;
            this.filteredTeams1 = this.teams.filter((value) => {
                return value.sport_id == sport;
            } );
        },
        removeSameTeam(team1) {
            if (team1 == 0) return ;
            this.filteredTeams2 = this.filteredTeams1.filter((value) => value.id != team1);
        },
        refreshTeams() {
            this.filteredTeams1 = this.teams;
            this.team2 = 0;
            this.team1 = 0;
        }

    }
}
</script>

<style scoped>

</style>
