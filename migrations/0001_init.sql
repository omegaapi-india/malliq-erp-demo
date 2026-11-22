-- MallIQ initial D1 schema and simulated seed data.
-- Shared database: omegaapi-demos. This app's namespace: MallIQ.
 CREATE TABLE IF NOT EXISTS config (app TEXT NOT NULL, key TEXT NOT NULL, value TEXT NOT NULL, PRIMARY KEY (app, key));
CREATE TABLE IF NOT EXISTS records (id INTEGER PRIMARY KEY AUTOINCREMENT, app TEXT NOT NULL, position INTEGER NOT NULL, cells TEXT NOT NULL);
CREATE TABLE IF NOT EXISTS activity (id INTEGER PRIMARY KEY AUTOINCREMENT, app TEXT NOT NULL, text TEXT NOT NULL, created_at TEXT NOT NULL DEFAULT (datetime('now')));
CREATE INDEX IF NOT EXISTS idx_records_app ON records(app, position);
CREATE INDEX IF NOT EXISTS idx_activity_app ON activity(app, id);

DELETE FROM activity WHERE app = 'MallIQ';
DELETE FROM records WHERE app = 'MallIQ';
DELETE FROM config WHERE app = 'MallIQ';

INSERT INTO config (app, key, value) VALUES ('MallIQ', 'heroStat', '"10 sample units · 2 work orders"');
INSERT INTO config (app, key, value) VALUES ('MallIQ', 'heroNote', '"Demo snapshot: occupancy is steady for the day."');
INSERT INTO config (app, key, value) VALUES ('MallIQ', 'bars', '[["Occupied","w90"],["Vacant","w60"],["Maintenance","w75"]]');
INSERT INTO config (app, key, value) VALUES ('MallIQ', 'strip', '[["10 sample units","Fictional tenants"],["No billing","No invoices or payment code"],["Database-backed","Actions stored in the demo database"],["Free to host","Cloudflare free tier"]]');
INSERT INTO config (app, key, value) VALUES ('MallIQ', 'safetyNote', '"Tenant names and units are invented. No invoices, contracts, or customer data are processed."');
INSERT INTO config (app, key, value) VALUES ('MallIQ', 'tableHead', '["Unit","Tenant","Category","Occupancy","Status"]');
INSERT INTO config (app, key, value) VALUES ('MallIQ', 'rows', '[["L-01","Sample Cafe","Food","Occupied","Active"],["L-02","Sample Books","Retail","Occupied","Active"],["L-03","Sample Style","Fashion","Occupied","Active"],["L-04","Vacant unit","Retail","Vacant","Available"],["U-01","Sample Tech","Electronics","Occupied","Active"],["U-02","Sample Care","Services","Maintenance","Review"]]');
INSERT INTO config (app, key, value) VALUES ('MallIQ', 'workflow', '[["Review units","Pick a unit from the sample board."],["Log footfall","Add a demo count without real sensors."],["Raise a task","A work order note appears in your demo log."]]');
INSERT INTO config (app, key, value) VALUES ('MallIQ', 'actions', '[["Log footfall"," logged sample footfall."],["Create work order"," created a demo work order."],["Issue invoice"," created a sample invoice draft in the demo."],["Close day"," closed the demo day in demo log."]]');

INSERT INTO records (app, position, cells) VALUES ('MallIQ', 1, '["L-01","Sample Cafe","Food","Occupied","Active"]');
INSERT INTO records (app, position, cells) VALUES ('MallIQ', 2, '["L-02","Sample Books","Retail","Occupied","Active"]');
INSERT INTO records (app, position, cells) VALUES ('MallIQ', 3, '["L-03","Sample Style","Fashion","Occupied","Active"]');
INSERT INTO records (app, position, cells) VALUES ('MallIQ', 4, '["L-04","Vacant unit","Retail","Vacant","Available"]');
INSERT INTO records (app, position, cells) VALUES ('MallIQ', 5, '["U-01","Sample Tech","Electronics","Occupied","Active"]');
INSERT INTO records (app, position, cells) VALUES ('MallIQ', 6, '["U-02","Sample Care","Services","Maintenance","Review"]');
