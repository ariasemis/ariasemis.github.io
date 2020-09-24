---
title: "GitHub Profile"
---

A while ago GitHub released a feature that allows users to customize their profile by using a README file.

While they could have just given us a big text field and call it a day, we got a whole repository to play with instead. This means that we can use all the tools that we are already familiar with, and it allows everyone to bring their own personality with images and custom scripts.

It's not surprising then that people quickly jumped into the bandwagon and started making [really][simonw] [creative][endorsements] [stuff][chess] on theirs.

Inspired by them, I decided to try my hand at it. If you want to take a look at it, [here's][profile] what I came up with.

## How ??

I think the default profile page is already quite good. It has an avatar, a bio, a list of your repositories. I think the only thing I miss when looking at someone's profile is a list of the languages they use. 

I decided to change that. I also wanted to get that info dynamically from GitHub itself. Even better, what if I actually **show** how to get that data?

I found [asciinema][] for recording terminal sessions, but given that I'm more comfortable with powershell, I went with this [unofficial port][PowerSession] instead.

The next step was to display this session in the README file. While [asciinema][] supports embedding a recording with a script, GitHub is very strict on which HTML tags it allows when rendering, so I had to come up with a different method.

Images do pass through GitHub's filter though, and with [svg-term][] I could render the entire session to an animated SVG. And because it's an SVG, it looks good even when zooming in!

Now the problem with showing this kind of stats is that they can change quite often and I don't want to have to manually update this page every time it does.

So I prepared a GitHub Action to automate all this. 

Here's how it works:
* It's triggered either manually or on a weekly schedule.
* Sets up Node.js and installs dependencies.
* Runs a script[^1] that
    * gets the latest data from GitHub API
    * recreates the svg file with it
* Commits the changes

And that's it! If you didn't already, you can see this working on my [github profile][profile].

## Closing thoughts 

I'm pretty happy with the result so far, more so considering that I hacked this together in a couple of days.

There's still a lot of room for improvement. 
The generated SVG file is quite heavy and, given that I'm using GitHub's REST API instead of GraphQL, I end up making more API calls than I probably should. 

But I've already spent far too much time on this. 


<!-- footnotes -->

[^1]: I could have used a powershell script with the same logic displayed in the recording, but given that [svg-term][] uses Node, I went with that instead.

<!-- links -->

[profile]: https://github.com/ariasemis
[chess]: https://github.com/timburgan/timburgan
[endorsements]: https://github.com/sw-yx
[simonw]: https://github.com/simonw/simonw 
[asciinema]: https://asciinema.org/
[PowerSession]: https://github.com/ibigbug/PowerSession
[svg-term]: https://github.com/marionebl/svg-term

