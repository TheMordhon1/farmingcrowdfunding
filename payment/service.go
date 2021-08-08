package payment

import (
	"farmingcrowdfunding/user"
	"strconv"

	midtrans "github.com/veritrans/go-midtrans"
)

type service struct {
}

type Service interface {
	GetPaymentURL(transaction Transaction, user user.User) (string, error)
}

func NewService() *service {
	return &service{}
}

func (s *service) GetPaymentURL(transaction Transaction, user user.User) (string, error) {
	midclient := midtrans.NewClient()
	midclient.ServerKey = "SB-Mid-server-VIMDuzL0swbHPsGZ0EF5TDb0"
	midclient.ClientKey = "SB-Mid-client-Ij0k5eGRP79bQrvj"
	midclient.APIEnvType = midtrans.Sandbox

	snapGateway := midtrans.SnapGateway{
		Client: midclient,
	}

	snapReq := &midtrans.SnapReq{
		CustomerDetail: &midtrans.CustDetail{
			Email: user.Email,
			FName: user.Name,
		},
		TransactionDetails: midtrans.TransactionDetails{
			OrderID:  strconv.Itoa(transaction.ID),
			GrossAmt: int64(transaction.Amount),
		},
	}

	snapTokenResp, err := snapGateway.GetToken(snapReq)
	if err != nil {
		return "", err
	}

	return snapTokenResp.RedirectURL, nil
}
