CREATE TABLE manufacturer (
        _id INTEGER NOT NULL PRIMARY KEY,
        make TEXT NOT NULL UNIQUE
);
CREATE TABLE model (
        _id INTEGER NOT NULL PRIMARY KEY, 
        make_id INTEGER NOT NULL,
	model TEXT NOT NULL,
	CONSTRAINT U_make_model
	UNIQUE(make_id,model),
	FOREIGN KEY (make_id) REFERENCES manufacturer(_id)
); 
CREATE TABLE year (
        _id INTEGER NOT NULL PRIMARY KEY,
        year INTEGER NOT NULL,
        model_id INTEGER NOT NULL,
	CONSTRAINT U_year_model
	UNIQUE(year,model_id),
        FOREIGN KEY (model_id) REFERENCES model(_id)
);
