Product.delete_all

Product.create(:title => 'Web Design for Developers',
               :description =>
               %{<p>
                    Web Design for Developers will show you how to make your web-based application look professionally designed.
               </p>},
               :image_url => '/images/wd4d.jpg',
               :price => 42.95)

Product.create(:title => 'Programming for Beginners ',
               :description =>
               %{<p>
                    This is the best guide for programmers who are just beginning to explore their craft.
               </p>},
               :image_url => '/images/wd5d.jpg',
               :price => 12.99)

Product.create(:title => 'How NOT to Program',
               :description =>
               %{<p>
               This is a guide for people who have absolutely no idea how to program, well really it's a guide to tell you how not to program in the hopes that they may figure out how to do it on their own. Not that you hold a lot of hope out for that, but hey crazier things have been known to happen, and you really do need a break after that whole 'roofing' thing right? Don't worry we know how you feel. Thats why we made this book for you to give to your "employees". Good Luck (you'll need it).
               </p>},
               :image_url => '/images/wd6d.jpg',
               :price => 45.67)

Product.create(:title => 'Web Not Design for Developers',
               :description =>
               %{<p>
               Web Not Design for Developers will never show you how to make your web-based application look professionally designed.
               </p>},
               :image_url => '/images/wd7d.jpg',
               :price => 41.45)