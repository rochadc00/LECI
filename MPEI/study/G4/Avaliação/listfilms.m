function listfilms(user_id,Set,uitem)
    movies_seen = Set{user_id,1};
    num_movies = length(movies_seen);
    fprintf('Movies seen by user ID %d: \n',user_id);
    for i=1:num_movies
        num = movies_seen(i);
        fprintf('%s\n',uitem{num,1});
    end
    fprintf(2,'Press any key to continue!');
    pause();
end