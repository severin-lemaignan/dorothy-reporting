Introduction
============

Alternative titles:

-   The robot who pretend-played with me

-   I Guess Your Next Move! Leveraging Social Cues for Robots to
    Understand Free-play Situations

-   A Robot Which is Fun to Play With: Leveraging AI to Participate in
    Complex Social Situations

-   A Window Onto Your Mind: Playful Robots Leveraging Attention to
    Predict Actions

-   Playing Like your Friend: Dealing with the High Dimensionality of
    Real-World Social Dynamic

-   A Robot Which Adapts its Social Behaviour to its Partner’s Age

This article presents how attention tracking enables a robot to first
automatically segment a social interaction into meaningful situations
(*situation awareness*), and second, to predict the participants’
actions.

We study this effect in a high-dimensional social interaction situation
based on free dramatic play: pairs of children (4-7 years old) or robot
and child are invited to freely interact with characters and items on an
interactive table, telling and acting stories with no explicit goal set
in advance.

Although the actions performed by the children are not known beforehand,
our approach allows the robot to segment on the fly the interaction flow
into episodes whose main focus can be predicted and used to generate
pro-social behaviours.

Mutual Modelling: Theoretical Background
----------------------------------------

Human social dynamics rely upon the ability to effectively attribute
beliefs, goals and percepts to other people. This set of
meta-representational abilities shapes what is called a theory of mind
(ToM) or the ability to mentalize, and leads to mutual modelling: the
reciprocal ability to establish a mental model of the other. This lays
at the core of human interactions: normal human social interactions
depend upon the recognition of other sensory perspectives, the
understanding of other mental states, and the recognition of complex
non-verbal cues of attention and emotional state. As such, adapting and
transferring these cognitive skills to social robots is an important
research objective.

Understanding and predicting one’s behaviour.

An integrated theory of social cognition, applicable to robots

A principled yet practical approach to social cognition for artificial
intelligence

### Pretense

A second direction for the ’meta-cognitive foundations of mind
modelling’ is Leslie’s paper on the role of
pretense [@leslie1987pretense].

### Surface Alignment vs Deep Grounding

Pickering and Garrod [@pickering2006alignment] argue that mutual
understanding starts mostly with a *superficial alignment* at the level
of the linguistic representations, due to priming mechanisms, and that
this local alignment may – in some cases – lead to a *global alignment*
of the semantic level (*deep grounding*). For these authors, the
convergence in dialogue, and even the repair of some misunderstandings,
is explained by this mimetic behavior more than by a monitoring of each
other’s knowledge:

> \[…\] interlocutors do not need to monitor and develop full common
> ground as a regular, constant part of routine conversation, as it
> would be unnecessary and far too costly. Establishment of full common
> ground is, we argue, a specialized and non-automatic process that is
> used primarily in times of difficulty (when radical misalignment
> becomes apparent). [@pickering2006alignment p.179]

analysis of behavioural alignment between partners (via metrics like the
recently proposed *Individual Motor Signature* [@slowinski2016dynamic])

### Theory of Mind

We previously covered the state of the research on theory of mind in
social robotics [@lemaignan2015mutual].

In [@scassellati2002theory], Scassellati gave an initial account of
Leslie’s and Baron-Cohen’s respective models of the emergence of a
theory of mind (we discuss them below) from the perspective of robotics,
but reported implementation work was limited to simple perceptual
precursors (like face detection or color saliencies detection). Since
then, research in this field has been focused on applications relying on
Flavell’s *Level 1* [@flavell1977development] perspective-taking,
[i.e.]{}perspective-taking that only requires perceptual abilities (“*I
see (you do not see the book)*”), and actually mostly limited to visual
perception (relevant work include Breazeal [@breazeal2006using],
Trafton [@Trafton2005] and Ros [@Ros2010]).

Based on perspective taking *Level 1* alone, Breazeal [et
al.]{}[@breazeal2009embodied] and Warnier [et al.]{}[@warnier2012when]
successfully tackled the classical hallmark of theory of mind, the false
belief experiment (also known as the “Sally and Anne” experiment,
introduced by [@wimmer1983beliefs], original experimental setting
by [@baron1985does]). They demonstrated complete human-robot interaction
scenarios where robots recognize and handle false belief situations in
dyadic or triadic interactions, and exhibit helping behaviours that
account for the missing/false beliefs of the human partners.

[@devin2016implemented]

### Connections vs. representations {#connection-representation}

In [@flavell1990developmental], Flavell relates perspective taking
*Level 1* to establishing *cognitive connections* (I see, I hear, I
want, I like, I fear...), in contrast to perspective taking *Level 2*
that relates to manipulating *representations*. This is exemplified by
*appearance-reality* tasks, like the *elephant mask* experiment proposed
in [@flavell1990developmental]: 3-years old children are not able to
tell that an experimenter hidden behind a large elephant mask but who
speaks normally *looks* like an elephant, *sounds* like the
experimenter, and *really is* the experimenter. It appears that, while
those children are able to explicitly manipulate cognitive connections
(they know for instance that these are largely independent of each other
and that they can evolve over time) and know as well that their own
connections are independent of those of other people, they do not think
that one concept can *seriously* ([i.e.]{}non playfully) hold several,
possibly conflicting, representations.

Attention in Robotics
---------------------

Stages of play
--------------

In developmental psychology, Parten’s [**stages of
play**]{} [@parten1932social]:

1.  [**Solitary (independent) play**]{}: Playing separately from others,
    with no reference to what others are doing.

2.  [**Onlooker play**]{}: Watching others play. May engage in
    conversation but not engaged in doing. True focus on the children at
    play.

3.  [**Parallel play**]{} (adjacent play, social coaction): Playing with
    similar objects, clearly beside others but not with them (near but
    not with others.)

4.  [**Associative play**]{}: Playing with others without organization
    of play activity. Initiating or responding to interaction with
    peers.

5.  [**Cooperative play**]{}: Coordinating one’s behavior with that of a
    peer. Everyone has a role, with the emergence of a sense of
    belonging to a group. Beginning of “team work.”

Social Interaction during Free Play
===================================

A novel methodology
-------------------

The study of the emergence of social behaviour is often intrinsically
limited by the nature of the experimental tasks. Where traditional
socio-cognitive tasks are either toy scenarios ([i.e.]{}they do not
adequately mirror real-world situations) or simple, constrained tasks
that do not reflect the complexity and dynamics of real-world
interactions, free play social interactions exhibit a rich set of
natural cognitive and social dynamics that are desirable for this
research. We introduce a new experimental paradigm based on free play
interactions.

![The free play social interactions sandbox. Data acquisition is
performed under two (between subjets) conditions: either children
playing together, or one child playing with a *non-social*
robot.[]{data-label="fig|setup"}](setup-child-child.png "fig:"){width="0.4\linewidth"}
![The free play social interactions sandbox. Data acquisition is
performed under two (between subjets) conditions: either children
playing together, or one child playing with a *non-social*
robot.[]{data-label="fig|setup"}](setup-child-robot.png "fig:"){width="0.4\linewidth"}

To mitigate the technical challenges presented by free play interactions
in their most unconstrained version (like high dimensionality and
uncertainties), we have developped a *free play sandbox*,
Figure \[fig|setup\]: a large touchscreen (60cm $\times$ 33cm) is used
as an interactive surface (*sandtray*
paradigm [@baxter2012touchscreen]). Two agents (either a pair of
children or one child and one robot) play together by freely moving on a
2D plane items (characters and blocks, see Figure \[fig|sandbox\]). A
background image depicts a generic empty environment, with different
symbolic zones (water, grass, path, bushes...). The players do not have
any particular task to complete, they are simply invited to freely play.

children can engage in open-ended and non-directive play situations, yet
sufficiently defined to be reproducible;

Socio-cognitive Framing
-----------------------

focus on abstract socio-cognitive facets (robot perception and
manipulation are simplified); well suited for qualitative and
quantitative analysis using metrics like Słowinski’s Individual Motor
Signature (for behavioural alignment), Anderson’s [@anderson2004social]
coding of children’s free-play interactions, with-me-ness (for
assessment of co-engagment).

carefully framed: as far as possible, they ne- cessitate only the
cognitive capabilities that they ev- idence (e.g. if they evidence a
purely socio-linguistic mechanism, they will not mandate complex action
ca- pabilities – they may benefit from it, though),

This point is especially important as it allows an incremental path: a
robot should be able to tackle one or several of these task
independently of the others, and a re- search team may progressively
extend their cognitive models to incorporate more and more of the
cognitive capabilities required by the robot to address all of the
tasks.

Analysis of the free play sandbox
---------------------------------

Our free play sandbox elicits a loosely structured play situation. The
situation is indeed essentially aimless (free play). The goals and play
episodes that we observe during the interactions are not pre-defined,
and essentially unknown until they are decided by the players. In this
sense, the free play sandbox permits and elicits what is fundamentally
*unstructured play*.

However, a second look reveals some important structuring elements.

First, the physical bounds of the sandbox (an interactive table) limit
the play zone to a well defined and relatively small area. As a
consequence, children are mostly static (they are sitting in front of
the table) and their primary form of interaction is 2D pick and place of
items by drag and dropping them on the screen.

Second, the game items themselves structure the game scenarios. Items
are either iconic characters (animals or children) or plain blocks
(Figure \[fig|sandbox\]). The former have strong semantics associated to
them (like ’crocodiles like water and eat children’), while the later
have little semantics associated. The game background, with its
recognizable zones, also elicit a particular type of games (like
building a zoo or pretending we explore the savannah).

Finally, the social setting (two players facing each other) implicitely
invites social interaction: onlooker play, for instance, is unlikely to
be observed as the children are physically engaged with the game and the
other participant (they are sitting in front of game, close to each
other). The three higher forms of social play listed by Parten (parallel
play, associative play and cooperative play) are however possible with
this setup.

Two more elements (the role and place of the experimenter, and the
initial prompt given to the participant) have an important impact on the
shape of the play situation. We discuss separately these two points in
the description of the experimental procedure.

Overall, the free play sandbox supports a *loosely structured* form of
play: the actual play situations are not known and might change several
times during the interaction; the game actions, even though all based on
a single modality (picking and placing game items), are unlimited; the
social interactions between participants are multi-modal (speech, body
postures, gestures, facial expressions, etc.) and unconstrainted.
However, the broad domain of the play situations and the range of
possible social interactions is bound by the physical bounds of the play
zone and the theme of the game items.

Forms of play elicited by the sandbox
-------------------------------------

-   dramatic play

-   storytelling

-   creative play

-   pretend play

#### From unstructured to structured play

![Example of a game situation: the child and the robot ‘build’ together
a zoo. Items (animals, characters...) can be dragged over the whole play
area, while the background picture can be painted
over.[]{data-label="fig|sandbox"}](sandbox){width="0.9\linewidth"}

#### Pretence

![Possible play situation: the children pretend to release the cheetah
and create a story where the cheetah scares away the
visitors.[]{data-label=""}](sandbox-release-cheetah){width="0.7\linewidth"}

Implementation
--------------

The sandbox is implemented using mainly two frameworks: the Qt’s
*QtQuick* framework for the graphical interface of the game, and the
*Robot Operating System* (ROS) for the modular implementation of the
data processing and behaviour generation pipelines.

Figure \[fig|architecture\] presents the software architecture of the
sandbox.

![Architecture of the free play sandbox. Yellow nodes represent hardware
(cameras and robot); purple nodes relate to the game interface; red
nodes manage the robot; the green node implements the game policy (when
the robot is playing); blue nodes relates to visual attention
tracking.](freeplay-sandbox-architecture "fig:"){width="\linewidth"}
\[fig|architecture\]

![The freeplay sandbox, viewed at runtime within ROS RViz. The current
background drawing is published on a regular image topic and computer
vision is used to segment it into zones (visible in the central panel).
The poses and bounding boxes of the interactive items are published as
well, and turned into an occupancy map, used to plan the robot’s arm
motion.[]{data-label="fig|rviz"}](rviz-sandtray){width="0.9\linewidth"}

Research Questions and Hypotheses
=================================

The mechanisms underlying the social interactions happening during free
play raise important questions for social robotics.

Game Dynamics
-------------

-   do we observe a sequence of sub-games?

-   how are these sub-games initiated?

-   how does A keep track of what B is playing at?

-   how do we segment the action flow into meaningful play situations?

Social Dynamics
---------------

-   does a “social protocol” establish?

-   if so, what are these social rules?

-   implicit vs explicit rule setting?

-   what interaction modalities (or combination thereof) are relied upon
    to establish and maintain this “social protocol”?

Mental representations
----------------------

-   Does A know what B is thinking of at time t?

-   Do the participants perform explicit grounding of their respective
    mental models (ie, ask the other one what she is
    doing/thinking/planning to do?)

-   How does the implicit grounding take place? attention tracking?

-   Do we need at all to know what the other intends to do to actually
    collaborate? surface alignment vs deep grounding

-   Procedural (how do you do it?) vs Semantic grounding (what are you
    doing? playing at?)

Interplay between these questions
---------------------------------

\[fig|researchquestions\]

High level Hypotheses
---------------------

-   autonomous behaviour *ensues from*

Operational Hypotheses
----------------------

#### Protodeclarative pointing

Protoimperative vs protodeclarative pointing [@baron1989perceptual]

#### Behavioural Alignment

#### Verbalization of the (Social) Attentional Process

#### False-beliefs

Picture ordering protocol, with *mechanical*, *behavioural* and
*intentional* sequences [@baron1986mechanical]

#### Symbol Grounding

#### Recursive Awareness

I can describe what I’m aware of, I can also recursively be aware I’m
describing my state of awareness, and I can verbalize this second order
awareness.

This should work *Attention Schema* theory because the attention schema
is seen as a regular sensory representation [@graziano2013consciousness
p.55].

#### Adapted behaviour to the interacting agent

A robot facing a baby, a 3 years old, a 5 years old, a 13 years old or
an adult should behave differently.

#### Parten’s stages of play

Experiments
===========

Procedure
---------

Data Analysis
-------------

![Screenshot of the interaction analysis tool: faces of the two children
are recorded, as well as any interaction occuring on the interactive
table.[]{data-label="fig|analysis"}](analysis){width="\linewidth"}

Results
-------

Discussion: Towards a Model of Socio-Cognitive Awareness for Robots
===================================================================

The classical approach
----------------------

Symbolic approaches to social cognition work by first building a mental
model of the interacting humans. This is typically done by a combination
of 3D situation assessment (the robot builds and update a semantic 3D
model of its environment) and visual perspective taking (based on the
estimation of the pose of the human head). This permits the computation
of allocentric, and more importantly, egocentric spatial relations
between the spatial entities in the environment (we call it *social
situation assessment*).

This geometric computations are then turned into symbolic
representations, typically using logical statements (embedded in logic
programming [@tenorth2009knowrob] or ontologies [@lemaignan2010oro]).

The robot creates and continuously updates one symbolic model per
agent [@lemaignan2010oro]. These models are then used by other cognitive
processes (task planning, dialogue, task execution supervision) that are
designed to take advantage of the agents’ knowledge models to produce
socially-aware behaviours: for example, the task planner may plan
manipulation task using only entities visible to the
human [@lallement2014hatp], or the dialogue manager may use the specific
knowledge model of the speaker to interpret the speech, avoiding
grounding ambiguities that might otherwise
occur [@lemaignan2011grounding].

This works well as long as we limit ourselves to the manipulation of the
results of visual perspective taking. However, one intuitively
recognizes that social modelling goes indeed beyond computing what the
human perceives or does not perceive. This has been clearly recognized
in developmental psychology, for instance with Flavell’s distinction
between *cognitive connections* on one hand, and *mental
representations* on the other hand (we will come back to Flavell’s
*connection-representation* account in
section \[connection-representation\]). Now, if we are to model someone
else’s mind beyond a naive geometric model of their perception, we
indeed enter the realm of *representations*. What are they? How to
access them? How to represent and manipulate them? These three questions
lay at the core of this work, and as such we effectively take over the
point we previously made in [@lemaignan2015mutual]: we ultimately want
to come up with a meta-representational cognitive system to *represents
representations* (including representations of *false* beliefs or
unknown facts, [i.e.]{}suppositions).

We must immediately clarify that, even though this goal may seem to
pre-suppose *symbolic* meta-representations, this is not the case: at
that stage, we do not have evidence that a particular kind of
computational structure may better support the representation and
manipulation of mental representations.

\[What is not adequately solved by current techniques?\]

\[give concrete examples of social situations that are not easily
achieveable with current (symbolic or not) approaches\]

\[this examples should be turned into predictions for what our proposal
should be able to achieve\]

Phenomenal [*vs.*]{}Access Consciousness
----------------------------------------

Neuroscientist view: Block’s proposal of two kind of
consciousness [@block1996can]: *phenomenal* consciousness as the raw
inner experience; *access* consciousness as the more abstract, cognitive
ability to think about and report on those experiences.

Does this map to the traditional sub-symbolic/symbolic divide that we
observe in artificial intelligence, and in particular in robotics?

The *phenomenal consciousness* would then be the immediate raw
perceptual inputs: video streams from cameras, readings for torque and
force sensors, joint positions, etc.

The *access consciousness* would typically be the symbolic
representation of these inputs.

We must however keep in mind that there is likely no such rigid
dichotomy between phenomenal consciousness and access consciousness. It
is rather a continuum of processing [@graziano2013consciousness p.55]

Recursivity of consciousness: if I’m looking at a green apple, my
cognitive machinery can decide and report that I’m aware of green. I can
also be aware of the deciding and aware of the
reporting [@graziano2013consciousness p.55].

From Social Attention to Social Modelling: the Attention Schema Theory
----------------------------------------------------------------------

The hypothesis that we hereafter develop and turn into a cognitive model
is the following: **mental representations are snapshots of awareness,
awareness being itself a label for the memory-mediated process of
attention**.

This extends to social cognition: **modelling others’ mental
representations is taking snapshots of their current state of
awareness**. As we do not have direct access to others’ process of
attention, it has to be mediated. We suggest that **modelling other’s
state of awareness is mediated by one’s own attentional system, through
joint attention mechanisms**.

Our approach draws form the *Attention Schema Theory*, proposed by
Grazino [@graziano2013consciousness].

What awareness can do? “the brain *does* attention, but *knows*
awareness”: as such, “awareness can in principle be verbally reported”.

Associative Memory as an Informational Proxy for the Attention System

1.  Perceptual inputs feed in an associative memory

2.  the resulting set of pre-activated units is the current *focus of
    attention* – this step may require dimensionality reduction
    techniques

3.  According to the Attention Schema Theory, by *explicitely* labelling
    the activated and pre-activated units as being attended, we make the
    robot *aware* of the corresponding phenomenons.

4.  The labelling occurs by the mean of a symbolic association within a
    semantic network (ontology)

#### Attention

Modelled as a *Biased Competition Model of
Attention* [@desimone1995neural]. Implemented using a particular
*Associative Memory Network* with an additional top-down biasing
mechanism.

#### Memory-mediated Attention

*Attention* is modelled as the set of activated units in an associative
memory network.

Interplay between multi-modal social cues on one hand, and priming of
previously activated physical entities (objects, agents) and

Attention

#### Biasing Mechanisms

Biasing competition [@beck2009top]

The bottom-up biasing mechanism follows naturally from the structure of
the associatve memory model: a strong and long activation of a
perceptual input leads to the activation of the corresponding unit in
the memory network and the suppression of competing inputs.

The top-down mechanism is to be invented :-) It should enable high-level
decisional processes to effectively suppress (or reinforce) units. The
*nature* and *representation* of these high-level processes is unclear,
but might be of symbolic nature.

#### Social Attention

What do we call the *attention state* of a partner?

Grazino [@graziano2013consciousness]: “the mental machinery to model
someone else attentional state is the same as the one used for oneself.”

“In both case, the purpose is understanding and predicting one’s
behaviour.”

Cues from which we reconstruct someone else’s attentional state (from
Graziano):

-   gaze direction

-   facial expression

-   body language

-   prior knowledge of person

-   location of salient objects

Conclusion
==========
