import 'package:examen/app/core/sql_lite/sql_helper.dart';

class FillData {
  FillData({required this.sqlHelper});
  ISqlHelper sqlHelper;

  Future<void> insertProducers() async {
    const query = <String>[
      'INSERT INTO Producers(name) VALUES("Walt Disney")',
      'INSERT INTO Producers(name) VALUES("Universal Pictures")',
      'INSERT INTO Producers(name) VALUES("Paramount Pictures")',
    ];

    for (var item in query) {
      await sqlHelper.insert(query: item);
    }
  }

  Future<void> insertActors() async {
    const query = <String>[
      'INSERT INTO Actors(name, alias) VALUES("Robert De Niro", "The Godfather")',
      'INSERT INTO Actors(name, alias) VALUES("Al Pacino", "The Godfather")',
      'INSERT INTO Actors(name, alias) VALUES("James Caan", "The Godfather")',
      'INSERT INTO Actors(name, alias) VALUES("Marlon Brando", "The Godfather")',
      'INSERT INTO Actors(name, alias) VALUES("Alan Grant", "Alan")',
      'INSERT INTO Actors(name, alias) VALUES("John Travolta", "John")',
    ];
    for (var item in query) {
      await sqlHelper.insert(query: item);
    }
  }

  Future<void> insertMovies() async {
    const query = <String>[
      'INSERT INTO Movies(name, description, producer_id) VALUES("The Godfather", "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.", 1)',
      'INSERT INTO Movies(name, description, producer_id) VALUES("The Godfather: Part II", "The early life and career of Vito Corleone in 1920s New York is portrayed while his son, Michael, expands and tightens his grip on the family crime syndicate.", 1)',
      'INSERT INTO Movies(name, description, producer_id) VALUES("The Godfather: Part III", "The Godfather: Part II continues as the Corleone family fights to free the city from organized crime.", 1)',
      'INSERT INTO Movies(name, description, producer_id) VALUES("The Dark Knight", "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, the caped crusader must come to terms with one of the greatest psychological tests of his ability to fight injustice.", 2)',
    ];
    for (var item in query) {
      await sqlHelper.insert(query: item);
    }
  }

  Future<void> insertMovieActor() async {
    const query = <String>[
      'INSERT INTO MovieActors(movie_id, actor_id) VALUES(1, 1)',
      'INSERT INTO MovieActors(movie_id, actor_id) VALUES(1, 2)',
      'INSERT INTO MovieActors(movie_id, actor_id) VALUES(1, 3)',
      'INSERT INTO MovieActors(movie_id, actor_id) VALUES(1, 4)',
      'INSERT INTO MovieActors(movie_id, actor_id) VALUES(2, 5)',
      'INSERT INTO MovieActors(movie_id, actor_id) VALUES(2, 6)',
      'INSERT INTO MovieActors(movie_id, actor_id) VALUES(3, 5)',
      'INSERT INTO MovieActors(movie_id, actor_id) VALUES(3, 6)',
      'INSERT INTO MovieActors(movie_id, actor_id) VALUES(4, 5)',
      'INSERT INTO MovieActors(movie_id, actor_id) VALUES(4, 6)',
      'INSERT INTO MovieActors(movie_id, actor_id) VALUES(5, 5)',
      'INSERT INTO MovieActors(movie_id, actor_id) VALUES(5, 6)',
      'INSERT INTO MovieActors(movie_id, actor_id) VALUES(6, 5)',
      'INSERT INTO MovieActors(movie_id, actor_id) VALUES(6, 6)',
    ];
    for (var item in query) {
      await sqlHelper.insert(query: item);
    }
  }
}
