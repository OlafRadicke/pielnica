-- Create table

DROP TABLE IF EXISTS blog_article;

CREATE TABLE blog_article
(
    doc_id    serial primary key,
    doc_data  json
);

INSERT INTO blog_article (doc_data) VALUES (
  '{ "title": "Erster Eintrag", "author": { "first_name": "Olaf", "last_name": "Radicke" }, "text": "Hallo Welt!", "tags": ["test", "kurz"] }');


INSERT INTO blog_article (doc_data) VALUES (
  '{ "title": "Zweiter Eintrag", "author": { "first_name": "Hugo", "last_name": "Schwarz" }, "text": "Hallo Foo!", "tags": ["foo", "kurz"] }');

-- Is a value in a array?
SELECT *  FROM blog_article WHERE  doc_data->'tags' ? 'kurz' ;
SELECT doc_data->'title', doc_data->'tags'  FROM blog_article WHERE doc_data #>> '{tags}' = 'kurz';
