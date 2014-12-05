function out = csv_to_array(csv_path, event_name, varargin)
%CSV_TO_ARRAY Converts the csv produced by read_video.py into a logical
%array of event frames
%    If the csv is a list of frames, varargin should be the total number of
%    frames in the video.

table = readtable(csv_path,'Delimiter',',','ReadVariableNames',false, 'ReadRowNames',true);

array = table2array(table(event_name, :));

if max(array) == 1
    out = array;
    return
end

logical = zeros(varargin{1},1);
for i = 1:length(array)
    logical(array(i)) = 1;

out = logical;
return

end

