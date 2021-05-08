package com.project.fp.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.common.LongPrimitiveIterator;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.ThresholdUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.UserBasedRecommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;

import com.project.fp.dto.RecommendDto;


public class Recommand {

	public static void main(String[] args) throws IOException, TasteException {
		DataModel dm = new FileDataModel(new File("./src/result.csv"));
		
		UserSimilarity sim = new PearsonCorrelationSimilarity(dm);
		
		UserNeighborhood neighborhood = new ThresholdUserNeighborhood(0.1, sim, dm);
		
		UserBasedRecommender recommender = new GenericUserBasedRecommender(dm, neighborhood, sim);
		
		int x=1;
		for(LongPrimitiveIterator users = dm.getUserIDs(); users.hasNext();) {
			long userId = users.nextLong();
			List<RecommendedItem> recommendations = recommender.recommend(userId, 10);
			for(RecommendedItem recommenation:recommendations) {
				System.out.println(userId+","+recommenation.getItemID()+","+recommenation.getValue());
			}

			if(++x > 20) break;
		}
	}
}
