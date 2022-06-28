function search(string,movies,MinHashValue2)
    
    similar_titles = [];
    K = 100;                                % experimentar 25-200 (de 25 em 25) !!!!!!!!! 
                                            %(número de funções de hash)
                                            %(provavelmente 150)
    hash_vector = inf(1,K);
    shingle = {};
    for j = 1:strlength(string)-1                            % se o shingle for de 3, meter
        temporary = char(extractBetween(string, j, j+1));    %strlength(...)-2 e j = j+2)
        shingle{end+1} = temporary;
    end
    
    for j = 1:length(shingle)
        chave = char(shingle{j});
        hash = zeros(1,K);
        for kk = 1:K
            chave = [chave num2str(kk)];
            hash(kk) = DJB31MA(chave,127);
        end
        hash_vector(1,:) = min([hash_vector(1,:);hash]);
    end
    
    d_jac = ones(1,length(movies)); %save jaccard distances
    for i = 1:length(movies)
        d_jac(i) = sum(MinHashValue2(i,:)~=hash_vector)/K;
    end
    
    for i = 1:5
        [value,id] = min(d_jac);
        if (value <= 0.99)
            d_jac(id) = 1;
            similar_titles = [similar_titles movies(id)];
        end
    end
    
    fprintf('The movies you are probably searching for are: \n');
        for i = 1:length(similar_titles)
            fprintf('%s\n',similar_titles(i));
        end
    
    fprintf(2,'Press any key to continue!');
    pause();
end