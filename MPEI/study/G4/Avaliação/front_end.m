%% Front End
% 1 - Correr o ficheiro back_end
% 2 - Correr o ficheiro front_end que utilizará as funções
clc

load back_end
prompt = 'Insert User ID (1 to 943): ';
user_id = input(prompt);
while (user_id < 1) || (user_id > 943)
        clc
        fprintf(2,'Invalid ID, try again!\n');
        user_id = input(prompt);
end

continuar = true;
while continuar
    prompt = '\n1 - Your Movies\n2 - Get Suggestions\n3 - Search Title\n4 - Exit\nSelect choice: ';
    option = input(prompt);
    
    switch option
        case 1
            listfilms(user_id,Set,uitem);
        case 2
            prompt = '\n1- Action, 2- Adventure, 3- Animation, 4- Children’s\n5- Comedy, 6- Crime, 7- Documentary, 8- Drama\n9- Fantasy, 10- Film-Noir, 11- Horror, 12- Musical\n13- Mystery, 14- Romance, 15- Sci-Fi, 16- Thriller\n17- War, 18- Western\nSelect choice: ';  
            genre = input(prompt);
            while (genre < 1) || (genre > 18)
                clc
                fprintf(2,'Select a valid option!\n');
                genre = input(prompt);
            end
            advice(user_id,genre,uitem,Set,J1);
        case 3
            prompt = 'Write a string: ';
            string = lower(input(prompt,'s'));
            while strlength(string)<=2                 %<= 2 para shingles de tamanho 2
                clc
                prompt= 'Write a valid string: ';
                string = lower(input(prompt,'s'));
            end
            search(string,movies,MinHashValue2);
        case 4
            clc
            fprintf(2,'Exited the program sucessfully!\n');
            continuar = false;
        otherwise
            clc
            fprintf(2,'Please select one of the options!\n');
    end
end
