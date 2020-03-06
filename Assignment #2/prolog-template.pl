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

superstate(panicMode, panicInit).
superstate(panicMode, panic).
superstate(panicMode, panicParked).

superstate(cruiseMode, cruise).
superstate(cruiseMode, tailingMode).
superstate(cruiseMode, changeLane).
superstate(cruiseMode, accelerate).
superstate(cruiseMode, decelerate).
superstate(cruiseMode, laneChange).
superstate(cruiseMode, turn).
superstate(cruiseMode, destinationAhead).
superstate(cruiseMode, destinationArrived).


transition(idle, parkedMode, ignition, null, null).
transition(parkedMode, null, 'turn off', null, null).
transition(parkedMode, manualDrivingMode, beep, 'destination not set', null).
transition(parkedMode, manualDrivingMode, null, 'engine is idle', null).
transition(parkedMode, cruiseMode, null, 'destination is set', null).
transition(manualDrivingMode, parkedMode, null, null, null).
transition(cruiseMode, parkedMode, null, null, null).
transition(cruiseMode, manualDrivingMode, 'switch to manual', null, null).
transition(cruiseMode, panicMode, null, 'unforseen event', 'car is stopped ; hazard signal is turned ON').
transition(cruiseMode, parkedMode, 'turn off panic', 'hazard signal is turned OFF').

transition(parked, parked, 'set destination', 'the navigation system destination is set', null).

transitiom(drivingMode, drivingMode, 'accelerate', 'speed < max', 'engine runs faster').
transitiom(drivingMode, drivingMode, 'reduce speed', 'speed > 0', 'engine runs slower').
transition(drivingMode, breakMode, 'break', null, 'engine is stopped').
transition(breakMode, drivingMode, 'accelerate', null, 'engine runs faster').

transition(cruising, cruising, 'Maintain Speed', 'Distance > ThresholdLimit', null).
transition(cruising, changeLane, 'Change one lane left', 'ObstacleNotMoving or SafeDistanceNotAttainable', null).
transition(cruising, tailingMode, 'slow down', 'Distance < ThresholdLimit', null).
transition(tailingMode, 'maintain speed', 'distance > ThresholdLimit', null).
transition(changeLane, cruising, null, 'LaneChangeFinished', null).

transition(cruising, cruising, 'maintain speed', 'CurrentSpeed > 95% of default speed and CurrentSpeed < 105% of default speed', null).
transition(cruising, accelerate, 'accelerate', 'CurrentSpeed < MinimalSpeed', null).
transition(cruising, decelerate, 'decelerate', 'CurrentSpeed > MaximalSpeed', null).
transition(accelerate, cruising, 'Maintain Speed', 'CurrentSpeed > 95% of default speed and CurrentSpeed < 105% of default speed', null).
transition(decelerate, cruising, 'Maintain Speed', 'CurrentSpeed > 95% of default speed and CurrentSpeed < 105% of default speed', null).

trantition(panicInit, panic, 'Manual Signal On', 'Stop and Hazards On', null).
trantition(panicInit, panic, 'Automatic Signal On', 'Stop and Hazards On', null).
transition(panic, panicParked, 'panic signal off', 'UserTurnedPanicSignalOff', null).

transition(cruising, laneChange, 'signal off', 'IsLeftmost or IsRightMost', null).
transition(cruising, laneChange, 'change to rightmost lane', 'IsRightSignalOn', null).
transition(cruising, destinationAhead, 'Turn on Destination Ahead Signal', 'IsDestinationAhead', null).
transition(cruising, turn, 'right turn', 'UpcomingIntersection and IsRightSignalOn', null).
transition(cruising, turn, 'left turn', 'UpcomingIntersection and IsLeftSignalOn', null).
transition(laneChange, cruising, 'signal off', 'IsLeftmost or IsRightMost', null).
transition(turn, cruising, null, 'IsTurnFinished', null).
transition(turn, 'Destination Arrived', 'Turn off Signal, Turn right and Stop', 'IsRightMost and DestinationAheadSignalsOn', null).
transition(destinationAhead, laneChange, 'Change to rightmost lane', 'isNotRightMost', null).
transition(destinationAhead, turn, null, 'isRightMost', null).

transition(cruising, laneChange, null, 'RightSignalOn', null).
transition(cruising, laneChange, null, 'LeftSignalOn', null).
transition(cruising, panic, 'Panic Mode turned on', 'LeftLaneNotOpen and RightLaneNotOpen and ObstacleDetected', null).
trantition(laneChange, laneChange, null, 'LeftLaneNotOpen', null).
trantition(laneChange, laneChange, null, 'RightLaneNotOpen', null).
trantition(laneChange, laneChange, 'Change lane', 'LeftLaneOpen', null).
trantition(laneChange, laneChange, 'Change lane', 'RightLaneOpen', null).


%% =============================================================================
%%
%%  Rules
%%
%% =============================================================================




%% eof.
