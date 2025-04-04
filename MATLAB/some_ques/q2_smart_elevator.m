%% Smart elevator system

current_floor = input("You're currently of floor number (Digit only)? ");
total_floors = input("What's the total number of floors in the building?");

req_floors=zeros(1,total_floors); % List of requested floors

disp("Enter each floor number you'll want to visit, followed by the ENTER key")

n = 1;
while n <= total_floors
   req_floors(n) = input('');
   n = n + 1;
end

up_floors = req_floors(req_floors > current_floor);
down_floors = req_floors(req_floors < current_floor);

sorted_floors = [];
if ~isempty(up_floors)
    % The code below will overwrite the values in 'sorted_floors'
    % sorted_floors = sort(up_requests);

    % This one won't
    sorted_floors = [sorted_floors, sort(up_floors)];
end
if ~isempty(down_floors)
    sorted_floors = [sorted_floors, sort(down_floors, 'descend')]; % Sort in descending order
end

% Display optimized travel order
fprintf('Optimized order:');
fprintf(' %d', sorted_floors);
fprintf('\n');

% Calculate total floors traveled
%%% Complete it