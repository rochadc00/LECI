package Ex2;

public class Movie {
    private String name, genre, rating;
    private double score, runningTime;

    public Movie(String name, double score, String rating, String genre, double runningTime) {
        this.name=name;
        this.genre=genre;
        this.rating=rating;
        this.score=score;
        this.runningTime=runningTime;
    }

    @Override
    public String toString() {
        return "A informação sobre o filme é:\n Nome: " + name + "\n Score: " + score + "\n Rating: " + rating + "\n Genre: "+ genre + "\n Running Time: "+ runningTime;
    }
}

