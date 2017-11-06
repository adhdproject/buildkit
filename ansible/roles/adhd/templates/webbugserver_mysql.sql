create table if not exists webbug.requests (
  id TEXT,
  type TEXT,
  ip_address TEXT,
  user_agent TEXT,
  time INT(11)
);
