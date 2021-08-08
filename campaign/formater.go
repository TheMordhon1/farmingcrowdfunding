package campaign

import "strings"

type CampaignFormater struct {
	ID               int    `json:"id"`
	UserID           int    `json:"user_id"`
	Name             string `json:"name"`
	ShortDescription string `json:"short_description"`
	ImageURL         string `json:"image_url"`
	GoalAmount       int    `json:"goal_amount"`
	CurrentAmount    int    `json:"current_amount"`
	Slug             string `json:"slug"`
}

func FormatCampaign(campaign Campaign) CampaignFormater {
	campaignFormater := CampaignFormater{}
	campaignFormater.ID = campaign.ID
	campaignFormater.UserID = campaign.UserID
	campaignFormater.Name = campaign.Name
	campaignFormater.ShortDescription = campaign.ShortDescription
	campaignFormater.GoalAmount = campaign.GoalAmount
	campaignFormater.CurrentAmount = campaign.CurrentAmount
	campaignFormater.Slug = campaign.Slug
	campaignFormater.ImageURL = ""

	if len(campaign.CampaignImages) > 0 {
		campaignFormater.ImageURL = campaign.CampaignImages[0].FileName
	}

	return campaignFormater
}

func FormatCampaigns(campaigns []Campaign) []CampaignFormater {

	campaignsFormater := []CampaignFormater{}

	for _, campaign := range campaigns {
		campaignFormater := FormatCampaign(campaign)
		campaignsFormater = append(campaignsFormater, campaignFormater)
	}

	return campaignsFormater
}

type CampaignDetailFormater struct {
	ID               int                     `json:"id"`
	Name             string                  `json:"name"`
	ShortDescription string                  `json:"short_description"`
	Description      string                  `json:"description"`
	ImageURL         string                  `json:"image_url"`
	GoalAmount       int                     `json:"goal_amount"`
	CurrentAmount    int                     `json:"current_amount"`
	BackerCount      int                     `json:"backer_count"`
	UserID           int                     `json:"user_id"`
	Slug             string                  `json:"slug"`
	Perks            []string                `json:"perks"`
	User             CampaignUserFormater    `json:"user"`
	Images           []CampaignImageFormater `json:"images"`
}

type CampaignUserFormater struct {
	Name     string `json:"name"`
	ImageURL string `json:"image_url"`
}

type CampaignImageFormater struct {
	ImageURL  string `json:"image_url"`
	IsPrimary bool   `json:"is_primary"`
}

func FormatCampaignDetail(campaign Campaign) CampaignDetailFormater {
	campaignDetailFormater := CampaignDetailFormater{}
	campaignDetailFormater.ID = campaign.ID
	campaignDetailFormater.Name = campaign.Name
	campaignDetailFormater.ShortDescription = campaign.ShortDescription
	campaignDetailFormater.Description = campaign.Description
	campaignDetailFormater.GoalAmount = campaign.GoalAmount
	campaignDetailFormater.CurrentAmount = campaign.CurrentAmount
	campaignDetailFormater.BackerCount = campaign.BackerCount
	campaignDetailFormater.UserID = campaign.UserID
	campaignDetailFormater.Slug = campaign.Slug
	campaignDetailFormater.ImageURL = ""

	if len(campaign.CampaignImages) > 0 {
		campaignDetailFormater.ImageURL = campaign.CampaignImages[0].FileName
	}

	var perks []string

	for _, perk := range strings.Split(campaign.Perks, ",") {
		perks = append(perks, strings.TrimSpace(perk))
	}

	campaignDetailFormater.Perks = perks

	/* Field User */
	user := campaign.User

	campaignUserFormater := CampaignUserFormater{}
	campaignUserFormater.Name = user.Name
	campaignUserFormater.ImageURL = user.AvatarFileName

	campaignDetailFormater.User = campaignUserFormater

	/* Field Image */
	images := []CampaignImageFormater{}

	for _, image := range campaign.CampaignImages {
		campaignImageFormater := CampaignImageFormater{}
		campaignImageFormater.ImageURL = image.FileName

		isPrimary := false

		if image.IsPrimary == 1 {
			isPrimary = true
		}
		campaignImageFormater.IsPrimary = isPrimary

		images = append(images, campaignImageFormater)
	}

	campaignDetailFormater.Images = images

	return campaignDetailFormater
}
