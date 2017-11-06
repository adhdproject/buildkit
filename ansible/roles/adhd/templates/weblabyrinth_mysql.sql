create table if not exists weblabyrinth.crawlers (
  crawler_ip TEXT,
  crawler_rdns TEXT,
  crawler_useragent TEXT,
  first_seen INT(11),
  last_seen INT(11),
  last_alert INT(11),
  num_hits INT(11)
);
