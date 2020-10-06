---
title: "GitHub Profile"
date: 2020-09-23 22:00:00 -0300
tags: code me
---

A while ago GitHub released a feature to allow users to customize their profile with a README file.

Although they could have given us a big text field and call it a day, we've got a whole repository to play with instead. This means that we can use pictures and custom scripts to showcase our own personalities. 

Not surprising then that people soon began to make [pretty][endorsements] [creative][chess] [stuff][simonw] with theirs.

Inspired by them, I decided to try my hand at it. If you want to take a look at it, [here's][profile] what I came up with.

## Idea

To me, the default profile page is already quite good. It has an avatar, a bio, a list of your repositories. The only thing I miss when looking at someone's profile is a list of the languages they use. 

That's something I can fix. I can get the languages used from GitHub itself. Not only that, what if I actually **show** how to get them? 

With this in mind, I started working on it.

I found out about [asciinema][]. With it[^1], I recorded the process of getting and displaying the data from GitHub's API.

Now I needed some way to display this session in the README file. GitHub is very strict on which HTML tags it allows so I couldn't go with [asciinema][]'s embedded player.

Images are allowed though, and with [svg-term][] I could render the entire session to an animated SVG. And yeah it ends up being quite heavy, but at least you can zoom in without loss of quality.

_**Update**: I just found out that Chrome isn't that good at rendering SVGs, so if you want to see it properly I recommend you use firefox._

## Self-update

Another problem is that the data I'm querying will change over time, but I don't want to have to update this manually.

So I prepared a GitHub Action to automate this process. Here's how it works:

* It's triggered either by hand or on a weekly schedule.
* Sets up `Node.js` and installs dependencies.
* Runs a script[^2] that
    * gets the latest data from GitHub API
    * recreates the SVG file with it
* Commits the changes

And that's it! If you didn't already, you can see this working on my [GitHub profile][profile].

## Wrapping Up
 
I'm pretty happy with the result so far.

There's still a lot to improve. The code isn't particularly clean and I could probably reduce the number of API calls[^3].

But I've already spent far too much time on this.

{% comment %} footnotes {% endcomment %}

[^1]: Actually I used [this unofficial port][PowerSession]  for powershell instead.
[^2]: I could have used powershell like I did in the recording, but given that [svg-term][] uses `Node`, I went with that instead.
[^3]: By using GitHub's GraphQL API instead of REST.

{% comment %} links {% endcomment %}

[profile]: https://github.com/ariasemis
[chess]: https://github.com/timburgan/timburgan
[endorsements]: https://github.com/sw-yx
[simonw]: https://github.com/simonw/simonw 
[asciinema]: https://asciinema.org/
[PowerSession]: https://github.com/ibigbug/PowerSession
[svg-term]: https://github.com/marionebl/svg-term

