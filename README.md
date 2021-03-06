Novelshare
================

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

<div class="about-page">
<h1>A GoodReads Clone about Sharing</h1>

<p>The idea was to replicate a sharing economy web-app. I used a very arbitrary product such as books. </p>

<h3>My Goal was to learn a few things</h3>
<ul>
  <li>Relationship between MVC</li>
  <li>ORM, ActiveRecord</li>
  <li>API usage</li>
  <li>Rspec, Capybara </li>
  <li>SQL searching</li>
</ul>

<h3>While reinforcing concepts</h3>
<ul>
  <li>Zurb Foundation Framework/Responsive Design</li>
  <li>Ruby Fundamentals</li>
  <li>Javascript Hover States</li>
  <li>Rails Deployment</li>
  <li>Gems</li>
</ul>

<h1> How to Use </h1>

<p>Users can "share" books that they wish to have others borrow.
It will then be entered to the database as a new book</p>

<p>All shared books are referenced through the GoodReads API. If the API cannot locate the book title, then "showing" a book will not display any information. However the book can still be checked out, returned, and removed</p>

<h1>Features</h1>

<p>BookDrop is a feature that generates a book for the current user. It uses Nokogiri to parse the 'most popular' list of goodreads, fetching a random book from the list using Ruby.</p>

<p>Javascript hover toggles will highlight one of three statuses (Available, unavailable, new) Availibility is based on whether a book is checked out or not. A book is considered "new" so long it is less than 4 days old. </p>

<p>A presenter class is wrapped around each book to give specific class characteristics. This is used to generate the necessary hoverstates for javascript.</p>



</div>






