১. What is PostgreSQL?
PostgreSQL হল একটি শক্তিশালী, ওপেন সোর্স অবজেক্ট-রিলেশনাল ডাটাবেস সিস্টেম যার ৩৫ বছরেরও বেশি সময় ধরে সক্রিয় উন্নয়নের ফলে এটি নির্ভরযোগ্যতা, বৈশিষ্ট্যের দৃঢ়তা এবং কর্মক্ষমতার জন্য একটি শক্তিশালী খ্যাতি অর্জন করেছে।
২. What is the purpose of a database schema in PostgreSQL?
PostgreSQL-এ, একটি স্কিমা একটি লজিক্যাল কন্টেইনার বা নেমস্পেস হিসেবে কাজ করে যেখানে টেবিল, ভিউ, ফাংশন এবং ডেটা টাইপের মতো ডাটাবেস অবজেক্টগুলিকে সংগঠিত করা হয়, যা ডাটাবেসের আরও ভাল ব্যবস্থাপনা, সংগঠন এবং সুরক্ষার জন্য সহায়ক। 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
Primary Key (প্রাইমারি কী): এটি একটি নির্দিষ্ট কলাম বা কলাম সমষ্টি, যা টেবিলের প্রতিটি রেকর্ডকে ইউনিকভাবে চিহ্নিত করে। এটি কখনোই NULL হবে না এবং ডুপ্লিকেটও হবে না।
Foreign Key (ফরেন কী):এটি একটি টেবিলের একটি কলাম, যা অন্য টেবিলের প্রাইমারি কি রেফারেন্স করে। এর মাধ্যমে দুটি টেবিলের মধ্যে সম্পর্ক স্থাপন হয়।
4.What is the difference between the VARCHAR and CHAR data types?

CHAR এবং VARCHAR এর মধ্যে মূল পার্থক্য
CHAR এর একটি নির্দিষ্ট আকার আছে, কিন্তু VARCHAR এর একটি পরিবর্তনশীল আকার আছে। CHAR ডেটা টাইপ নির্দিষ্ট দৈর্ঘ্যের ডেটা সঞ্চয় করে, যেখানে VARCHAR ডেটা টাইপ পরিবর্তনশীল ফর্ম্যাটের ডেটা সঞ্চয় করে। VARCHAR ডেটা টাইপের মানগুলিতে স্পেস থাকে না; CHAR মানগুলিতে নির্দিষ্ট দৈর্ঘ্যের স্পেস থাকে।
5.Explain the purpose of the WHERE clause in a SELECT statement.
SELECT স্টেটমেন্টে WHERE ক্লজ ব্যবহার করা হয় ডাটা ফিল্টার করার জন্য। এটি নির্দিষ্ট শর্তের ভিত্তিতে ডাটা নির্বাচন করতে সাহায্য করে, যাতে শুধুমাত্র প্রয়োজনীয় তথ্য পাওয়া যায়।
6.What are the LIMIT and OFFSET clauses used for?
LIMIT নির্দিষ্ট করে একটি ডাটা কুয়েরির মধ্যে কতগুলো ডাটা দেখানো হবে।
OFFSET নির্ধারণ করে কত নম্বর রেকর্ড থেকে ডাটা দেখানো শুরু হবে।
7.How can you modify data using UPDATE statements?
UPDATE স্টেটমেন্ট পুরাতন টেবিলের ডাটা সংশোধন বা পরিবর্তন করার জন্য ব্যবহৃত হয়। এটি নির্দিষ্ট WHERE শর্ত অনুযায়ী নির্দিষ্ট রেকর্ডগুলো আপডেট করতে সাহায্য করে।
UPDATE employees SET salary = 50000 WHERE id = 101;
8.What is the significance of the JOIN operation, and how does it work in PostgreSQL?
JOIN অপারেশন ডেটাবেজের একাধিক টেবিল থেকে ডেটা একত্র করার জন্য অত্যন্ত গুরুত্বপূর্ণ। প্রায়শই, ডেটা বিভিন্ন টেবিলে বিভক্ত থাকে, এবং একটি নির্দিষ্ট তথ্য পেতে হলে একাধিক টেবিলের ডেটা একত্রিত করার প্রয়োজন হয়। JOIN অপারেশন এই কাজটিকে সহজ করে তোলে। PostgreSQL-এ বিভিন্ন JOIN রয়েছে:

INNER JOIN: উভয় টেবিলে মিল থাকা রেকর্ড রিটার্ন করে।

LEFT JOIN: বাম টেবিলের সব রেকর্ড এবং মিল থাকা ডান টেবিলের রেকর্ড রিটার্ন করে।

RIGHT JOIN: ডান টেবিলের সব রেকর্ড এবং মিল থাকা বাম টেবিলের রেকর্ড রিটার্ন করে।

FULL JOIN: উভয় টেবিলের সমস্ত রেকর্ড রিটার্ন করে।
SELECT employees.name, departments.department_name
FROM employees
INNER JOIN departments
ON employees.department_id = departments.id;
9.Explain the GROUP BY clause and its role in aggregation operations.
GROUP BY হলো PostgreSQL-এ একটি শক্তিশালী SQL ক্লজ, যা ডাটাকে গ্রুপ করে এবং প্রতিটি গ্রুপের উপর অ্যাগ্রিগেট ফাংশন (যেমন COUNT, SUM, AVG, ইত্যাদি) প্রয়োগ করতে সাহায্য করে। এটি মূলত একই মানের রেকর্ডগুলোকে একসাথে করে এবং তাদের উপর গণনা চালায়, যার ফলে সংশ্লিষ্ট গ্রুপের তথ্যের সারাংশ পাওয়া যায়।
10.How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?
এগুলি অ্যাগ্রিগেট ফাংশন যা গণনা, যোগফল এবং গড় বের করতে সাহায্য করে।
COUNT(): মোট রেকর্ড সংখ্যা গণনা করতে

SUM(): মানগুলোর যোগফল দেয়

AVG(): গড় মান হিসাব করে

SELECT COUNT(\*) FROM orders; -- মোট অর্ডারের সংখ্যা গণনা  
SELECT SUM(salary) FROM employees; -- সব কর্মচারীর মোট বেতন  
SELECT AVG(age) FROM students; -- শিক্ষার্থীদের গড় বয়স
