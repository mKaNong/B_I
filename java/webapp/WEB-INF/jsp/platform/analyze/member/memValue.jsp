
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
 
			<c:set value="${result.rowlist[0][1]+ result.rowlist[0][2]+ result.rowlist[0][3]+ result.rowlist[0][4]}" var="a7"></c:set>
			<c:set value="${result.rowlist[1][1]+ result.rowlist[1][2]+ result.rowlist[1][3]+ result.rowlist[1][4]}" var="b7"></c:set>
			<c:set value="${result.rowlist[2][1]+ result.rowlist[2][2]+ result.rowlist[2][3]+ result.rowlist[2][4]}" var="c7"></c:set>
			<c:set value="${result.rowlist[3][1]+ result.rowlist[3][2]+ result.rowlist[3][3]+ result.rowlist[3][4]}" var="d7"></c:set>
			<c:set value="${result.rowlist[4][1]+ result.rowlist[4][2]+ result.rowlist[4][3]+ result.rowlist[4][4]}" var="e7"></c:set>
			
			
			<c:set value="${result.rowlist[0][1]+ result.rowlist[1][1]+ result.rowlist[2][1]+ result.rowlist[3][1]+ result.rowlist[4][1]}" var="a8"></c:set>
			<c:set value="${result.rowlist[0][2]+ result.rowlist[1][2]+ result.rowlist[2][2]+ result.rowlist[3][2]+ result.rowlist[4][2]}" var="b8"></c:set>
			<c:set value="${result.rowlist[0][3]+ result.rowlist[1][3]+ result.rowlist[2][3]+ result.rowlist[3][3]+ result.rowlist[4][3]}" var="c8"></c:set>
			<c:set value="${result.rowlist[0][4]+ result.rowlist[1][4]+ result.rowlist[2][4]+ result.rowlist[3][4]+ result.rowlist[4][4]}" var="d8"></c:set>
			 
			 
					<table>
						<thead>
							<tr>
								<th width="14.28%">
									<div class="oblique"></div>
									<div class="recent recent-time">最近交易时间<br>R（天）</div>
									<div class="recent recent-stat">交易次数<br>F（次）</div>
								</th>
								<th width="20.28%">${result.rowlist[0][0]}</th>
								<th width="13.28%">${result.rowlist[1][0]}</th>
								<th width="13.28%">${result.rowlist[2][0]}</th>
								<th width="13.28%">${result.rowlist[3][0]}</th>
								<%-- <th width="14.28%">${result.rowlist[4]}</th> --%>
								<th>合计</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${result.columlist[0]}</td>
								<td id="a1">
								<c:choose>
									 <c:when test="${result.rowlist[0][1]!=null}">
									      ${result.rowlist[0][1]}人
									   </c:when>
									     <c:otherwise>-</c:otherwise>
								 </c:choose>
							   </td>
								<td id="a2">
								<c:choose>
									 <c:when test="${result.rowlist[0][2]!=null}">
									      ${result.rowlist[0][2]}人
									   </c:when>
									     <c:otherwise>-</c:otherwise>
								 </c:choose>
								 </td>
								<td id="a3">
								<c:choose>
									 <c:when test="${result.rowlist[0][3]!=null}">
									      ${result.rowlist[0][3]}人
									   </c:when>
									     <c:otherwise>-</c:otherwise>
								 </c:choose>
								 </td>
								<td id="a4">
								<c:choose>
									 <c:when test="${result.rowlist[0][4]!=null}">
									      ${result.rowlist[0][4]}人
									   </c:when>
									     <c:otherwise>-</c:otherwise>
								 </c:choose>
								  </td>
								<%-- <td id="a5">${result.valueList.get("R<=2000<F<=1") }人</td> --%>
								<td id="a6"><c:choose>
								     <c:when test="${a7>0}">${a7}人<p class="scale"><fmt:formatNumber value="${a7/result.valueList.allpaycusts*100 }" pattern="#.#"/>%</p></c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
							</tr>
							<tr>
								<td>${result.columlist[1]}</td>
								<td id="b1">
								<c:choose>
									 <c:when test="${result.rowlist[1][1]!=null}">
									      ${result.rowlist[1][1]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose>
								</td>
								<td  id="b2">
								<c:choose>
									 <c:when test="${result.rowlist[1][2]!=null}">
									      ${result.rowlist[1][2]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<td id="b3">
								<c:choose>
									 <c:when test="${result.rowlist[1][3]!=null}">
									      ${result.rowlist[1][3]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<td id="b4">
								<c:choose>
									 <c:when test="${result.rowlist[1][4]!=null}">
									      ${result.rowlist[1][4]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<%-- <td id="b5">${result.valueList.get("R<=2001<F<=3") }人</td> --%>
								<td id="b6"><c:choose>
								     <c:when test="${b7>0}">${b7}人<p class="scale"><fmt:formatNumber value="${b7/result.valueList.allpaycusts*100 }" pattern="#.#"/>%</p></c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
							</tr>
							<tr>
								<td>${result.columlist[2]}</td>
								<td id="c1"><c:choose>
									 <c:when test="${result.rowlist[2][1]!=null}">
									      ${result.rowlist[2][1]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<td id="c2"><c:choose>
									 <c:when test="${result.rowlist[2][2]!=null}">
									      ${result.rowlist[2][1]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<td id="c3"><c:choose>
									 <c:when test="${result.rowlist[2][3]!=null}">
									      ${result.rowlist[2][3]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<td id="c4"><c:choose>
									 <c:when test="${result.rowlist[2][4]!=null}">
									      ${result.rowlist[2][4]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<%-- <td id="c5">${result.valueList.get("R<=2003<F<=4") }人</td> --%>
								<td id="c6"><c:choose>
								     <c:when test="${c7>0}">${c7}人<p class="scale"><fmt:formatNumber value="${c7/result.valueList.allpaycusts*100 }" pattern="#.#"/>%</p></c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
							</tr>
							<tr>
								<td>${result.columlist[3]}</td>
								<td id="d1"><c:choose>
									 <c:when test="${result.rowlist[3][1]!=null}">
									      ${result.rowlist[3][1]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<td id="d2"><c:choose>
									 <c:when test="${result.rowlist[3][2]!=null}">
									      ${result.rowlist[3][2]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<td id="d3"><c:choose>
									 <c:when test="${result.rowlist[3][3]!=null}">
									      ${result.rowlist[3][3]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<td id="d4"><c:choose>
									 <c:when test="${result.rowlist[3][4]!=null}">
									      ${result.rowlist[3][4]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<%-- <td id="d5">${result.valueList.get("R<=2004<F<=5") }人</td> --%>
								
								<td id="d6"><c:choose>
								     <c:when test="${d7>0}">${d7}人<p class="scale"><fmt:formatNumber value="${d7/result.valueList.allpaycusts*100 }" pattern="#.#"/>%</p></c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
							</tr>
							<tr>
							
								<td>${result.columlist[4]}</td>
								<td id="e1"><c:choose>
									 <c:when test="${result.rowlist[4][1]!=null}">
									      ${result.rowlist[4][1]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<td id="e2"><c:choose>
									 <c:when test="${result.rowlist[4][2]!=null}">
									      ${result.rowlist[4][2]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<td id="e3"><c:choose>
									 <c:when test="${result.rowlist[4][3]!=null}">
									      ${result.rowlist[4][3]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<td id="e4"><c:choose>
									 <c:when test="${result.rowlist[4][4]!=null}">
									      ${result.rowlist[4][4]}人
									 </c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose></td>
								<%-- <td id="e5">${result.valueList.get("R<=2005<F<=6") }人</td> --%>
								<td id="e6">
								<c:choose>
								     <c:when test="${e7>0}">${e7}人<p class="scale"><fmt:formatNumber value="${e7/result.valueList.allpaycusts*100 }" pattern="#.#"/>%</p></c:when>
									 <c:otherwise>-</c:otherwise>
								 </c:choose>
								</td>
							</tr>
							<tr>
								<td>列合计</td>
								<td  >
									 <c:choose>
									     <c:when test="${a8>0}">${a8}人<p class="scale"><fmt:formatNumber value="${a8/result.valueList.allpaycusts*100 }" pattern="#.#"/>%</p></c:when>
										 <c:otherwise>-</c:otherwise>
									 </c:choose>
								 
								 </td>
								<td  >
									 <c:choose>
									     <c:when test="${b8>0}">${b8}人<p class="scale"><fmt:formatNumber value="${b8/result.valueList.allpaycusts*100 }" pattern="#.#"/>%</p></c:when>
										 <c:otherwise>-</c:otherwise>
									 </c:choose>
								 
								 </td><td  >
									 <c:choose>
									     <c:when test="${c8>0}">${c8}人<p class="scale"><fmt:formatNumber value="${c8/result.valueList.allpaycusts*100 }" pattern="#.#"/>%</p></c:when>
										 <c:otherwise>-</c:otherwise>
									 </c:choose>
								 
								 </td><td  >
									 <c:choose>
									     <c:when test="${d8>0}">${d8}人<p class="scale"><fmt:formatNumber value="${d8/result.valueList.allpaycusts*100 }" pattern="#.#"/>%</p></c:when>
										 <c:otherwise>-</c:otherwise>
									 </c:choose>
								 
								 </td><!-- 	<td id="f5">111人<p class="scale">20%</p></td> -->
								<td  >${ result.valueList.allpaycusts }人<p class="scale">100%</p><input type="hidden" value="${result.valueList.allpaycusts}" id="allpaycusts"></td>
							</tr>
						</tbody>
					</table>
				 