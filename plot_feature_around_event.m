function feature_around_events = plot_feature_around_event(feature_array, event_array, n_frames, fps)
%PLOT_FEATURE_AROUND_EVENT Plot the specified feature for n_frames around each event

padded_feature_array = [nan(1,n_frames), feature_array, nan(1,n_frames)];
padded_event_array = [zeros(1,n_frames), event_array, zeros(1,n_frames)];
x_values = (-n_frames : n_frames)/fps;

feature_around_events = nan(sum(event_array), length(x_values));

event_frames = find(padded_event_array);
figure
hold on
for i = 1:length(event_frames)
    middle_frame = event_frames(i);
    feature_around_event = padded_feature_array(middle_frame - n_frames : middle_frame + n_frames);
    plot(x_values, feature_around_event);
    feature_around_events(i, :) = feature_around_event;
hold off
    
return

end

