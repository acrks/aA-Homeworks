require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end

  def self.find_by_title(title)
    play = PlayDBConnection.instance.execute(<<-SQL, title)
    SELECT
      *
    FROM 
      plays
    WHERE
      title = ?
    SQL
      Play.new(play.first)
  end

  def self.find_by_playwright(name)
  playwright = Playwright.find_by_name(name)
  raise "#{name} not found in database" unless playwright
  plays = PlayDBConnection.instance.execute(<<-SQL, title)
  SELECT
    *
  FROM 
    playwrights
  WHERE
    playwright_id = ?
  SQL
  plays.map {|play| Play.new(play)}
  end
end

class Playwright
  attr_accessor :id, :name, :birth_year
  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map { |datum| Playwright.new(datum) }
  end

  def self.find_by_name(name)
    playwright = PlayDBConnection.instance.execute(<<-SQL, name)
    SELECT
      *
    FROM
      playwrights
    WHERE
      name = ?
  SQL
  return nil if playwright.length < 1
  Playwright.new(playwright.first)
  end

  def new(new_pw)
    @id = new_pw['id']
    @name = new_pw['name']
    @birth_year = new_pw['birth_year']
  end

  def update
    raise "#{self} is already in the database" if self.id
    playwright = PlayDBConnection.instance.execute(<<-SQL, name, birthyear)
    INSERT INTO
      playwrights (name, birth_year)
    VALUES
      (?,?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def get_plays
    raise "#{self} not in database" unless self.id
    plays = PlayDBConnection.instance.execute(<<-SQL, self.id)
      SELECT
        *
      FROM
        plays
      WHERE
        playwright_id = ?
    SQL
    plays.map { |play| Play.new(play) }
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.id, self.name, self.birth_year)
      INSERT INTO
        playwrights (id, name, birth_year)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end
end
