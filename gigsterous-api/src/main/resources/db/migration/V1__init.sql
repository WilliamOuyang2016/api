/* USERS */
DROP TABLE IF EXISTS people;
CREATE TABLE people (
    person_id BIGINT PRIMARY KEY auto_increment,
    first_name VARCHAR(32),
    last_name VARCHAR(32),
    email VARCHAR(128) UNIQUE,
    gender VARCHAR(8),
    location VARCHAR(32),
    date_birth TIMESTAMP,
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* ENSEMBLES */
DROP TABLE IF EXISTS ensembles;
CREATE TABLE ensembles (
    ensemble_id BIGINT PRIMARY KEY auto_increment,
    ensemble_type VARCHAR(16),
    name VARCHAR(32),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* PEOPLE-ENSEMBLES mapping */
DROP TABLE IF EXISTS people_ensembles;
CREATE TABLE people_ensembles (
  person_id BIGINT NOT NULL REFERENCES people (person_id),
  ensemble_id BIGINT NOT NULL REFERENCES ensembles (ensemble_id),
  PRIMARY KEY (person_id, ensemble_id),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* SKILLS - user to skill mapping */
DROP TABLE IF EXISTS skills;
CREATE TABLE skills (
    skill_id BIGINT PRIMARY KEY auto_increment,
    person_id BIGINT REFERENCES people (person_id),
    instrument VARCHAR(16),
    level VARCHAR(16)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* EVENTS */
DROP TABLE IF EXISTS events;
CREATE TABLE events (
    event_id BIGINT PRIMARY KEY auto_increment,
    name VARCHAR(64),
    venue VARCHAR(64),
    event_date TIMESTAMP,
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* PEOPLE-EVENTS mapping */
DROP TABLE IF EXISTS people_events;
CREATE TABLE people_events (
  person_id BIGINT NOT NULL REFERENCES people (person_id),
  event_id BIGINT NOT NULL REFERENCES events (event_id),
  PRIMARY KEY (person_id, event_id),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* VENUES */
DROP TABLE IF EXISTS venues;
CREATE TABLE venues (
    venue_id BIGINT PRIMARY KEY auto_increment,
    name VARCHAR(128),
    lat DOUBLE,
    lon DOUBLE,
    google_id VARCHAR(128),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
