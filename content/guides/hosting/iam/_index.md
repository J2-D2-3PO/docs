---
menu:
  default:
    identifier: identity-and-access-management-iam
    parent: w-b-platform
title: Identity and access management (IAM)
url: guides/hosting/iam/org_team_struct
cascade:
- url: guides/hosting/iam/:filename
weight: 2
---

W&B Platform has three IAM scopes within W&B: [Organizations]({{< relref "#organization" >}}), [Teams]({{< relref "#team" >}}), and [Projects]({{< relref "#project" >}}).

## Organization

An *Organization* is the root scope in your W&B account or instance. All actions in your account or instance take place within the context of that root scope, including managing users, managing teams, managing projects within teams, tracking usage and more.

If you are using [Multi-tenant Cloud]({{< relref "/guides/hosting/hosting-options/saas_cloud.md" >}}), you may have more than one organization where each may correspond to a business unit, a personal user, a joint partnership with another business and more.

If you are using [Dedicated Cloud]({{< relref "/guides/hosting/hosting-options/dedicated_cloud.md" >}}) or a [Self-managed instance]({{< relref "/guides/hosting/hosting-options/self-managed.md" >}}), it corresponds to one organization. Your company may have more than one of Dedicated Cloud or Self-managed instances to map to different business units or departments, though that is strictly an optional way to manage AI practioners across your businesses or departments.

For more information, see [Manage organizations]({{< relref "./access-management/manage-organization.md" >}}).

## Team

A *Team* is a subscope within a organization, that may map to a business unit / function, department, or a project team in your company. You may have more than one team in your organization depending on your deployment type and pricing plan.

AI projects are organized within the context of a team. The access control within a team is governed by team admins, who may or may not be admins at the parent organization level.

For more information, see [Add and manage teams]({{< relref "./access-management/manage-organization.md#add-and-manage-teams" >}}).

## Project

A *Project* is a subscope within a team, that maps to an actual AI project with specific intended outcomes. You may have more than one project within a team. Each project has a visibility mode which determines who can access it.


Every project is comprised of [Workspaces]({{< relref "/guides/models/track/workspaces.md" >}}) and [Reports]({{< relref "/guides/core/reports/" >}}), and is linked to relevant [Artifacts]({{< relref "/guides/core/artifacts/" >}}), [Sweeps]({{< relref "/guides/models/sweeps/" >}}), and [Automations]({{< relref "/guides/core/automations/" >}}).
