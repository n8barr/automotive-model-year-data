/* Insert normalised data into flat format table */
INSERT INTO VehicleModelYear (year,make,model) SELECT y.year,ma.make,m.model FROM manufacturer ma INNER JOIN model m ON m.make_id=ma._id INNER JOIN year y ON y.model_id=m._id;
