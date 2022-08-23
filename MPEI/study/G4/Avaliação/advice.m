function advice(user_id,genre,uitem,Set,J)
    [val_J,similar_id] = min(J(user_id,:));
    tipo = genre + 2;
    seen_movies1 = Set{user_id};
    seen_movies2 = Set{similar_id};
    movies2watch = [];
    
    for i = 1:length(seen_movies2)
        genero = uitem{seen_movies2(i),tipo};
        if (~ismember(seen_movies2(i),seen_movies1) && genero(1)==1)  
           movies2watch = [movies2watch, string(uitem{seen_movies2(i),1})];
        end
    end
    if isempty(movies2watch)
        fprintf(2,'The are no matching movies for that specifications!\n');
    else
        fprintf('The movies, of the choosen genre, you would probably like to watch are: \n');
        for i = 1:length(movies2watch)
            fprintf('%s\n',movies2watch(i));
        end
    end
    fprintf(2,'Press any key to continue!');
    pause();
end