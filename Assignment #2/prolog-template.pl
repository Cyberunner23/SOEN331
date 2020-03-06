%% =============================================================================
%%
%%  CONCORDIA UNIVERSITY
%%  Department of Computer Science and Software Engineering
%%  SOEN 331-U:  Assignment 2
%%  Winter term, 2020
%%  Date submitted: March 7 2020
%%
%%  Authors: 
%%
%%  Alex Frappier Lachapelle, 40019133
%%  Alec Adub, 40032876
%%  Robert Nittolo, 40032587
%%  Pierre-Olivier Trottier, 40059235
%%
%% =============================================================================

%% =============================================================================
%%
%%  Facts
%%
%% =============================================================================

%% Top-level states
state(idle).
state(parkedMode).
state(cruiseMode).
state(manualDrivingMode).
state(panicMode).

%% Parked Mode states
state(parked).

%% Manual Driving Mode states
state(drivingMode).
state(breakMode).

%% Panic Mode states
state(panicInit).
state(panic).
state(panicParked).

%% Cruise Mode states
state(cruising).

state(tailingMode).
state(changeLane).

state(accelerate).
state(decelerate).

state(laneChange).
state(turn).
state(destinationAhead).
state(destinationArrived).

initial_state(idle, null).
initial_state(parkedMode, parked).
initial_state(manualDrivingMode, drivingMode).
initial_state(cruiseMode, cruising).

superstate(parkedMode, parked).

superstate(manualDrivingMode, drivingMode).
superstate(manualDrivingMode, breakMode).

%% TODO, panic mode
superstate(panicMode, null).




%% =============================================================================
%%
%%  Rules
%%
%% =============================================================================


%% eof.
