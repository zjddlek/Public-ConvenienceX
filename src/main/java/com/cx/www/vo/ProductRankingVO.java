package com.cx.www.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/*SELECT R.MCNAME, R.SCNAME, R.ACCNAME, R.PNAME, SUM(R.CNT) TOTAL, R.PRICE_SERVER, R.PRICE_CONSUMER, R.EXPIRYDATE, R.REGDATE
FROM (SELECT SAD.DETAILNO, SAD.SALENO, SAD.PNO_INFO, SAD.CNT, SAD.ISREFUND, SAD.DEALNO, SA.SALEDATE, SA.STOCKNO, ST.STOCK_COUNT, PI.PNO, PI.MANUDATE, 
PI.T_COUNT, P.REGDATE, P.PRICE_CONSUMER, P.PNO_ACCOUNT, P.SCNO, P.MCNO, SC.SCNAME, MC.MCNAME, PA.PNAME, PA.PRICE_SERVER, PA.EXPIRYDATE,
A.ACCNAME, A.ACCCEO, A.ACCCEOPHONE, A.ACCHEAD, A.ACCHEADPHONE, A.ACCLOC, A.ACCSTORAGELOC
	FROM SALES_DETAIL SAD, SALES SA, STOCK ST, PRODUCT_INFO PI, PRODUCT P, PRODUCT_ACCOUNT PA, ACCOUNTS A, SUB_CATEGORY SC, MAJOR_CATEGORY MC
	WHERE SAD.SALENO = SA.SALENO
	AND SA.STOCKNO = ST.STOCKNO
	AND ST.PNO_INFO = PI.PNO_INFO
	AND PI.PNO = P.PNO
	AND P.PNO_ACCOUNT = PA.PNO_ACCOUNT
	AND PA.ACCNO = A.ACCNO
	AND MC.MCNO = SC.MCNO
	AND SC.SCNO = P.SCNO) R
GROUP BY R.PNAME
ORDER BY SUM(R.CNT) DESC;*/

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductRankingVO {
	String mcName, scName, accName, pNo, pName;
	int total, priceServer, priceConsumer;
	String expirydate, regdate;
	public ProductRankingVO(String mcName, String scName, String accName, String pName, int total, int priceServer,
			int priceConsumer, String expirydate, String regdate) {
		super();
		this.mcName = mcName;
		this.scName = scName;
		this.accName = accName;
		this.pName = pName;
		this.total = total;
		this.priceServer = priceServer;
		this.priceConsumer = priceConsumer;
		this.expirydate = expirydate;
		this.regdate = regdate;
	}
	
	
}
